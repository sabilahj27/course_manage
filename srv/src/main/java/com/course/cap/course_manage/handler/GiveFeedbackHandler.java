package com.course.cap.course_manage.handler;

import java.time.OffsetDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sap.cds.ql.Insert;
import com.sap.cds.ql.cqn.CqnInsert;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.On;
import com.sap.cds.services.handler.annotations.ServiceName;
import com.sap.cds.services.persistence.PersistenceService;

import cds.gen.mainservice.CourseFeedbacks;
import cds.gen.mainservice.CourseFeedbacks_;
import cds.gen.mainservice.Enrollments;
import cds.gen.mainservice.EnrollmentsGiveFeedbackContext;
import cds.gen.mainservice.Enrollments_;

@Component
@ServiceName("MainService")
public class GiveFeedbackHandler implements EventHandler {
    @Autowired
    private PersistenceService db;

    @On(event = EnrollmentsGiveFeedbackContext.CDS_NAME, entity = Enrollments_.CDS_NAME)
    public void onGiveFeedback(EnrollmentsGiveFeedbackContext context) {
        Enrollments enrollment = db.run(context.getCqn()).single(Enrollments.class);
        CourseFeedbacks feedback = CourseFeedbacks.create();

        String comments = context.getComments();

        feedback.setComments(comments);
        feedback.setCourseId(enrollment.getCourseIDId());;
        feedback.setCreatedAt(java.sql.Timestamp.from(java.time.Instant.now()));

        CqnInsert insert = Insert.into(CourseFeedbacks_.CDS_NAME).entry(feedback);
        db.run(insert);

        context.setCompleted();

    }
}
