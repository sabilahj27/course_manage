using MainService as service from '../../srv/services';
annotate service.Enrollments with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : Student.FullName,
            Label : '{i18n>Fullname4}',
        },
        {
            $Type : 'UI.DataField',
            Value : CourseID.CourseName,
            Label : '{i18n>Coursename3}',
        },
        {
            $Type : 'UI.DataField',
            Value : EnrollmentDate,
            Label : '{i18n>Enrollmentdate}',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>General}',
            ID : 'General',
            Target : '@UI.FieldGroup#General',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>StudentInformation}',
            ID : 'StudentInformation',
            Target : '@UI.FieldGroup#StudentInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>CourseInformation}',
            ID : 'CourseInformation',
            Target : '@UI.FieldGroup#CourseInformation',
        },
    ],
    UI.FieldGroup #General : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : EnrollmentDate,
                Label : '{i18n>Enrollmentdate}',
            },
            {
                $Type : 'UI.DataField',
                Value : Grade,
                Label : '{i18n>Grade}',
            },
        ],
    },
    UI.FieldGroup #StudentInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : Student.FirstName,
                Label : '{i18n>Firstname3}',
            },
            {
                $Type : 'UI.DataField',
                Value : Student.LastName,
                Label : '{i18n>Lastname3}',
            },
            {
                $Type : 'UI.DataField',
                Value : Student.Email,
                Label : '{i18n>Email}',
            },
            {
                $Type : 'UI.DataField',
                Value : Student.RegisteredDate,
                Label : '{i18n>Registereddate2}',
            },
        ],
    },
    UI.FieldGroup #CourseInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : CourseID.CourseName,
                Label : '{i18n>Coursename4}',
            },
            {
                $Type : 'UI.DataField',
                Value : CourseID.Description,
                Label : '{i18n>Description}',
            },
            {
                $Type : 'UI.DataField',
                Value : CourseID.CreditHours,
                Label : '{i18n>Credithours3}',
            },
        ],
    },
    UI.Identification : [
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'MainService.setGrade',
            Label : '{i18n>Setgrade}',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'MainService.giveFeedback',
            Label : '{i18n>Givefeedback}',
        },
    ],
);

