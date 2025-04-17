package kr.ac.hansung.cse.controller;

import jakarta.validation.Valid;
import kr.ac.hansung.cse.model.Course;
import kr.ac.hansung.cse.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class CourseController {

    @Autowired
    private CourseService courseService;

    @GetMapping("/")
    public String home() {
        return "home";
    }

    // 1. 학년별 이수 학점 조회
    @GetMapping("/creditsByYear")
    public String showCreditsByYear(Model model) {
        List<Object[]> creditsByYearAndSemester = courseService.getCreditsGroupByYearAndSemester();
        int totalCredits = courseService.getTotalCredits();

        model.addAttribute("creditsByYearAndSemester", creditsByYearAndSemester);
        model.addAttribute("totalCredits", totalCredits);

        return "creditsByYear";
    }

    // 1-2. 상세 내역 조회
    @GetMapping("/courseDetail")
    public String showCourseDetail(@RequestParam("year") String year,
                                   @RequestParam("semester") int semester,
                                   Model model) {
        List<Course> courses = courseService.getCoursesByYearAndSemester(year, semester);

        model.addAttribute("year", year);
        model.addAttribute("semester", semester);
        model.addAttribute("courses", courses);

        return "courseDetail";
    }

    // 2. 수강 신청하기
    @GetMapping("/registerCourse")
    public String registerCourse(Model model) {
        model.addAttribute("course", new Course());
        return "registerCourse";
    }

    @PostMapping("/doRegister")
    public String doRegister(@Valid Course course, BindingResult result) {
        if(result.hasErrors()) {
            List<ObjectError> errors = result.getAllErrors();
            for(ObjectError error : errors) {
                System.out.println(error.getDefaultMessage());
            }
            return "registerCourse";
        }

        // 2025년 2학기로 고정
        course.setYear("2025");
        course.setSemester(2);
        System.out.println(course);
        courseService.insertCourse(course);
        System.out.println("registerCourse success");

        return "home";
    }

    // 3. 수강 신청 조회
    @GetMapping("/viewRegistration")
    public String viewRegistration(Model model) {
        List<Course> registeredCourses = courseService.getCoursesByYear2025Semester2();

        model.addAttribute("courses", registeredCourses);

        return "viewRegistration";
    }
}