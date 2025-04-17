package kr.ac.hansung.cse.service;

import kr.ac.hansung.cse.dao.CourseDao;
import kr.ac.hansung.cse.model.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseService {
    @Autowired
    private CourseDao courseDao;

    public List<Course> getAllCourses() {
        return courseDao.getCourses();
    }

    public List<Course> getCoursesByYearAndSemester(String year, int semester) {
        return courseDao.getCoursesByYearAndSemester(year, semester);
    }

    public List<Course> getCoursesByYear2025Semester2() {
        return courseDao.getCoursesByYear2025Semester2();
    }

    public List<Object[]> getCreditsGroupByYearAndSemester() {
        return courseDao.getCreditsGroupByYearAndSemester();
    }

    public int getTotalCredits() {
        return courseDao.getTotalCredits();
    }

    public void insertCourse(Course course) {
        courseDao.insert(course);
    }

    public void updateCourse(Course course) {
        courseDao.update(course);
    }

    public void deleteCourse(int id) {
        courseDao.delete(id);
    }
}