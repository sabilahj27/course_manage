package com.course.cap.course_manage.handler;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sap.cds.ql.Insert;
import com.sap.cds.ql.cqn.CqnInsert;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.On;
import com.sap.cds.services.handler.annotations.ServiceName;
import com.sap.cds.services.persistence.PersistenceService;

import cds.gen.mainservice.Courses_;
import cds.gen.mainservice.Courses;
import cds.gen.mainservice.CoursesEnrollStudentContext;
import cds.gen.mainservice.Enrollments;
import cds.gen.mainservice.Enrollments_;

@Component
@ServiceName("MainService")
public class EnrollStudentsHandler implements EventHandler{
    @Autowired
    private PersistenceService db;

    @On(event = CoursesEnrollStudentContext.CDS_NAME, entity = Courses_.CDS_NAME)
    public void onEnrollStudent(CoursesEnrollStudentContext context) {
        Courses course = db.run(context.getCqn()).single(Courses.class);
        Enrollments enrollment = Enrollments.create();

        String studentId = context.getStudent();
        
        enrollment.setStudentId(studentId);
        enrollment.setCourseIDId(course.getId());
        enrollment.setEnrollmentDate(LocalDate.now());
        // enrollment.setGrade(null);

        CqnInsert insert = Insert.into(Enrollments_.CDS_NAME).entry(enrollment);
        db.run(insert);
        
        context.setCompleted();
    }   
}
