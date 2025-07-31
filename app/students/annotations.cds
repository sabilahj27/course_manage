using MainService as service from '../../srv/services';
annotate service.Students with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : FullName,
            Label : '{i18n>Fullname}',
        },
        {
            $Type : 'UI.DataField',
            Value : RegisteredDate,
            Label : '{i18n>Registereddate}',
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
            Label : 'Enroll',
            ID : 'Enroll',
            Target : 'Enrollments/@UI.LineItem#Enroll',
        },
    ],
    UI.FieldGroup #GeneralInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : FirstName,
                Label : '{i18n>Firstname}',
            },
            {
                $Type : 'UI.DataField',
                Value : LastName,
                Label : '{i18n>Lastname}',
            },
            {
                $Type : 'UI.DataField',
                Value : Email,
                Label : '{i18n>Email}',
            },
            {
                $Type : 'UI.DataField',
                Value : RegisteredDate,
                Label : '{i18n>Registereddate}',
            },
        ],
    },
    UI.HeaderInfo : {
        TypeImageUrl : 'sap-icon://account',
        TypeName : '',
        TypeNamePlural : '',
    },
);

annotate service.Enrollments with @(
    UI.LineItem #Enroll : [
        {
            $Type : 'UI.DataField',
            Value : EnrollmentDate,
            Label : 'EnrollmentDate',
        },
        {
            $Type : 'UI.DataField',
            Value : Grade,
            Label : 'Grade',
        },
    ]
);

