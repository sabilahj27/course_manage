using db.schema from '../db/schemas';

service MainService {
    entity Students        as projection on schema.Student;

    entity Courses         as projection on schema.Course
        actions {
            action enrollStudent(
                                 @Common.ValueList: {
                                     $Type         : 'Common.ValueListType', // tipe = value help
                                     CollectionPath: 'Students', // ambil data dari table Student
                                     Parameters    : [
                                         {
                                             $Type            : 'Common.ValueListParameterInOut', // parameter yang return ke input field
                                             LocalDataProperty: student, // nama input parameter di action
                                             ValueListProperty: 'ID', // nama fields di table
                                         },
                                         {
                                             $Type            : 'Common.ValueListParameterDisplayOnly', // parameter yang display only
                                             ValueListProperty: 'FullName', // nama fields di table
                                         }
                                     ],
                                     Label         : 'Choose a Student'
                                 }
                                 @Common.ValueListWithFixedValues: false
                                 student: UUID);
        };

    entity CourseFeedbacks as projection on schema.CourseFeedback;
    entity Instructors     as projection on schema.Instructor;

    entity Enrollments     as projection on schema.Enrollment
        actions {
            action setGrade(Grade: Integer);
            action giveFeedback(Comments: String);
        };

    entity Expertise       as projection on schema.Expertise;
}

annotate MainService.Students with @odata.draft.enabled;
annotate MainService.Courses with @odata.draft.enabled;
annotate MainService.CourseFeedbacks with @odata.draft.enabled;
annotate MainService.Instructors with @odata.draft.enabled;
annotate MainService.Enrollments with @odata.draft.enabled;
