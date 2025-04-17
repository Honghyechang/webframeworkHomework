package kr.ac.hansung.cse.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@Entity
@Table(name="courses")
public class Course {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Size(min = 4, max = 4, message = "수강년도는 4자리여야 합니다")
    @Column(name="year")
    private String year;

    @Min(value = 1, message = "학기는 1 또는 2여야 합니다")
    @Max(value = 2, message = "학기는 1 또는 2여야 합니다")
    @Column(name="semester")
    private int semester;

    @NotEmpty(message = "교과코드는 필수 항목입니다")
    @Column(name="course_code")
    private String courseCode;

    @NotEmpty(message = "교과목명은 필수 항목입니다")
    @Column(name="course_name")
    private String courseName;

    @NotEmpty(message = "교과구분은 필수 항목입니다")
    @Column(name="course_type")
    private String courseType;

    @NotEmpty(message = "담당교수는 필수 항목입니다")
    @Column(name="professor")
    private String professor;

    @Min(value = 1, message = "학점은 1-3 사이여야 합니다")
    @Max(value = 3, message = "학점은 1-3 사이여야 합니다")
    @Column(name="credits")
    private int credits;
}