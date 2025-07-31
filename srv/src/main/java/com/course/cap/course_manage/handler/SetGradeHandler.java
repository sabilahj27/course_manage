package com.course.cap.course_manage.handler;

// import java.util.List;
// import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sap.cds.ql.Update;
import com.sap.cds.ql.cqn.CqnUpdate;
import com.sap.cds.services.handler.EventHandler;
// import com.sap.cds.services.handler.annotations.After;
import com.sap.cds.services.handler.annotations.Before;
import com.sap.cds.services.handler.annotations.On;
import com.sap.cds.services.handler.annotations.ServiceName;
import com.sap.cds.services.persistence.PersistenceService;

import cds.gen.mainservice.Enrollments;
import cds.gen.mainservice.EnrollmentsSetGradeContext;
import cds.gen.mainservice.Enrollments_;

@Component
@ServiceName("MainService")
public class SetGradeHandler implements EventHandler {

    @Autowired
    private PersistenceService db;

    @Before(event = EnrollmentsSetGradeContext.CDS_NAME, entity = Enrollments_.CDS_NAME)
    public void BeforeSetGrade(EnrollmentsSetGradeContext context) {
        Integer grade = context.getGrade();
        if (grade == null || grade < 0 || grade > 100) {
            throw new IllegalArgumentException("Grade must be between 0 and 100.");
        }
    }

    @On(event = EnrollmentsSetGradeContext.CDS_NAME, entity = Enrollments_.CDS_NAME)
    public void onSetGrade(EnrollmentsSetGradeContext context) {
        Integer grade = context.getGrade();
        Enrollments enrollment = db.run(context.getCqn()).single(Enrollments.class);

        enrollment.setGrade(grade);
        CqnUpdate update = Update.entity(Enrollments_.CDS_NAME).entry(enrollment);
        db.run(update);
        context.setCompleted();
    }
}
