using {cuid} from '@sap/cds/common';

namespace db.schema;

@assert.format: '^[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$'
type Email : String;

entity Student : cuid {
    @mandatory
    FirstName      : String;
    LastName       : String;
    FullName       : String = trim(coalesce(
        FirstName, ''
    ) || ' ' || coalesce(
        LastName, ''
    ));

    @mandatory
    Email          : Email;

    @mandatory
    RegisteredDate : Date;

    Enrollments    : Association to many Enrollment on Enrollments.Student = $self
}

entity Course : cuid {
    @mandatory
    CourseName   : String;
    Description  : String;

    @mandatory
    @assert.range: [1,7]
    CreditHours  : Integer;

    @mandatory
    Instructor   : Association to one Instructor;
    FeedbackID   : Association to many CourseFeedback on FeedbackID.Course = $self;
    Enrollments  : Association to many Enrollment on Enrollments.CourseID = $self;
}

entity CourseFeedback : cuid {
    Comments  : String;
    CreatedAt : DateTime;
    Course    : Association to one Course;
}

entity Instructor : cuid {
    @mandatory
    FirstName : String;
    LastName  : String;
    FullName  : String = trim(coalesce(
        FirstName, ''
    ) || ' ' || coalesce(
        LastName, ''
    ));

    @mandatory
    Email     : Email;

    @mandatory
    Expertise : String;

    Courses   : Association to many Course on Courses.Instructor = $self;
}

entity Enrollment : cuid {
    Student        : Association to one Student;
    CourseID       : Association to one Course;
    EnrollmentDate : Date;
    Grade          : Integer;
}

entity Expertise {
    key Name : String;
}
