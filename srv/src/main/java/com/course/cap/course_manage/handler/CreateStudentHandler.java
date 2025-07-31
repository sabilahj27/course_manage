package com.course.cap.course_manage.handler;

import java.time.LocalDate;

import org.springframework.stereotype.Component;

import com.sap.cds.services.cds.CdsCreateEventContext;
import com.sap.cds.services.cds.CqnService;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.Before;
import com.sap.cds.services.handler.annotations.ServiceName;

import cds.gen.mainservice.Students_;

@Component
@ServiceName("MainService")
public class CreateStudentHandler implements EventHandler {
    @Before(event = CqnService.EVENT_CREATE, entity = Students_.CDS_NAME)
    public void beforeCreateStudent(CdsCreateEventContext context) {
        context.getCqn().entries().forEach(entry -> {
            entry.put("RegisteredDate", LocalDate.now());
        });
    }
}
