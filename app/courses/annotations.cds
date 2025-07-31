using MainService as service from '../../srv/services';
annotate service.Courses with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : CourseName,
            Label : '{i18n>Coursename}',
        },
        {
            $Type : 'UI.DataField',
            Value : CreditHours,
            Label : '{i18n>Credithours}',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'MainService.enrollStudent',
            Label : '{i18n>Enrollstudent}',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>GeneralInformation}',
            ID : 'GeneralInformation',
            Target : '@UI.FieldGroup#GeneralInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Instructor',
            ID : 'Instructor',
            Target : '@UI.FieldGroup#Instructor1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Students}',
            ID : 'Students',
            Target : 'Enrollments/@UI.LineItem#Students',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Feedbacks}',
            ID : 'Feedbacks',
            Target : 'FeedbackID/@UI.LineItem#Feedbacks',
        },
    ],
    UI.FieldGroup #GeneralInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : CourseName,
                Label : '{i18n>Coursename1}',
            },
            {
                $Type : 'UI.DataField',
                Value : Description,
                Label : '{i18n>Description}',
            },
            {
                $Type : 'UI.DataField',
                Value : CreditHours,
                Label : '{i18n>Credithours1}',
            },
        ],
    },
    UI.FieldGroup #Instructor : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : InstructorID.FullName,
                Label : '{i18n>Fullname2}',
            },
            {
                $Type : 'UI.DataField',
                Value : InstructorID.Email,
                Label : '{i18n>Email}',
            },
        ],
    },
    UI.FieldGroup #Instructor1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : Instructor.FullName,
                Label : 'FullName',
            },
            {
                $Type : 'UI.DataField',
                Value : Instructor.Email,
                Label : 'Email',
            },
        ],
    },
);

annotate service.CourseFeedbacks with @(
    UI.LineItem #Feedbacks : [
        {
            $Type : 'UI.DataField',
            Value : Comments,
            Label : '{i18n>Comments}',
        },
        {
            $Type : 'UI.DataField',
            Value : CreatedAt,
            Label : '{i18n>Createdat}',
        },
    ]
);

annotate service.Enrollments with @(
    UI.LineItem #Students : [
        {
            $Type : 'UI.DataField',
            Value : Student.FirstName,
            Label : '{i18n>Firstname1}',
        },
        {
            $Type : 'UI.DataField',
            Value : Student.LastName,
            Label : '{i18n>Lastname1}',
        },
        {
            $Type : 'UI.DataField',
            Value : Student.Email,
            Label : '{i18n>Email}',
        },
        {
            $Type : 'UI.DataField',
            Value : Student.RegisteredDate,
            Label : '{i18n>Registereddate1}',
        },
    ]
);

