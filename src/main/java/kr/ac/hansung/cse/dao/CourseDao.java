package kr.ac.hansung.cse.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import kr.ac.hansung.cse.model.Course;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Repository
@Transactional
public class CourseDao {

    @PersistenceContext
    private EntityManager entityManager;

    public List<Course> getCourses() {
        return entityManager.createQuery("SELECT c FROM Course c", Course.class)
                .getResultList();
    }

    public List<Course> getCoursesByYearAndSemester(String year, int semester) {
        return entityManager.createQuery(
                        "SELECT c FROM Course c WHERE c.year = :year AND c.semester = :semester",
                        Course.class)
                .setParameter("year", year)
                .setParameter("semester", semester)
                .getResultList();
    }

    public List<Course> getCoursesByYear2025Semester2() {
        return entityManager.createQuery(
                        "SELECT c FROM Course c WHERE c.year = '2025' AND c.semester = 2",
                        Course.class)
                .getResultList();
    }

    public List<Object[]> getCreditsGroupByYearAndSemester() {
        return entityManager.createQuery(
                        "SELECT c.year, c.semester, SUM(c.credits) FROM Course c GROUP BY c.year, c.semester ORDER BY c.year ASC, c.semester ASC",
                        Object[].class)
                .getResultList();
    }

    public int getTotalCredits() {
        Object result = entityManager.createQuery(
                        "SELECT SUM(c.credits) FROM Course c")
                .getSingleResult();

        // null 체크 추가
        return (result != null) ? ((Number) result).intValue() : 0;
    }
    public void insert(Course course) {
        entityManager.persist(course);
    }

    public void update(Course course) {
        entityManager.merge(course);
    }

    public void delete(int id) {
        Course course = entityManager.find(Course.class, id);
        if (course != null) {
            entityManager.remove(course);
        }
    }
}