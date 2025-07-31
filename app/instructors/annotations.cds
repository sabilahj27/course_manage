using MainService as service from '../../srv/services';
annotate service.Instructors with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : FullName,
            Label : '{i18n>Fullname3}',
        },
        {
            $Type : 'UI.DataField',
            Value : Email,
            Label : '{i18n>Email}',
        },
        {
            $Type : 'UI.DataField',
            Value : Expertise,
            Label : '{i18n>Expertise}',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>GeneralInformations}',
            ID : 'GeneralInformations',
            Target : '@UI.FieldGroup#GeneralInformations',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Courses}',
            ID : 'Courses',
            Target : 'Courses/@UI.LineItem#Courses',
        },
    ],
    UI.FieldGroup #GeneralInformations : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : FirstName,
                Label : '{i18n>Firstname2}',
            },
            {
                $Type : 'UI.DataField',
                Value : LastName,
                Label : '{i18n>Lastname2}',
            },
            {
                $Type : 'UI.DataField',
                Value : Email,
                Label : '{i18n>Email}',
            },
            {
                $Type : 'UI.DataField',
                Value : Expertise,
                Label : '{i18n>Expertise}',
            },
        ],
    },
    UI.FieldGroup #Courses : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    },
);

annotate service.Courses with @(
    UI.LineItem #Courses : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : '{i18n>Id}',
        },
        {
            $Type : 'UI.DataField',
            Value : CourseName,
            Label : '{i18n>Coursename2}',
        },
        {
            $Type : 'UI.DataField',
            Value : Description,
            Label : '{i18n>Description}',
        },
        {
            $Type : 'UI.DataField',
            Value : CreditHours,
            Label : '{i18n>Credithours2}',
        },
    ]
);

annotate service.Instructors with {
    Expertise @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Expertise',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : Expertise,
                    ValueListProperty : 'Name',
                },
            ],
            Label : 'Expertise',
        },
        Common.ValueListWithFixedValues : true,
)};

