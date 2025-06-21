using {FinalProject as services} from '../service';
using from './annotations-items';

annotate services.Header with @odata.draft.enabled;

annotate services.Header with {
    ID           @title: 'Id Order';
    email        @title: 'Email'  @Communication.IsEmailAddress;
    firstName    @title: 'First name';
    lastName     @title: 'Last name';
    country      @title: 'Country';
    createOn     @title: 'Create On';
    deliveryDate @title: 'Delivery Date';
    orderStatus  @title: 'Order Status';
    imageUrl     @title: 'Image';
};

annotate services.Header with {
    ID @Common : { 
        ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Header',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : ID,
                    ValueListProperty : 'ID',
                }
            ],
        },
     };

     country @Common : { 
        ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Header',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : country,
                    ValueListProperty : 'country',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'firstName',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'ID',
                }
            ],
        },
     }
};


annotate services.Header with @(
    UI.HeaderInfo                   : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Sell Order',
        TypeNamePlural: 'Sell Orders',
        ImageUrl      : imageUrl,
        Title         : {
            $Type: 'UI.DataField',
            Value: ID,
        },
        Description   : {Value: `Order's data`}
    },
    UI.SelectionFields              : [
        ID,
        orderStatus_code,
        country
    ],
    Common.SemanticKey              : [ID],
    UI.LineItem                     : [
        {
            $Type                : 'UI.DataField',
            Value                : ID,
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '7rem',
            },
        },
        {
            $Type                : 'UI.DataField',
            Value                : email,
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '10rem',
            },
        },
        {
            $Type                : 'UI.DataField',
            Value                : firstName,
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '9rem',
            },
        },
        {
            $Type                : 'UI.DataField',
            Value                : lastName,
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '12rem',
            },
        },
        {
            $Type                    : 'UI.DataField',
            Value                    : orderStatus_code,
            Criticality              : orderStatus.criticality,
            CriticalityRepresentation: #WithIcon,
            ![@HTML5.CssDefaults]    : {
                $Type: 'HTML5.CssDefaultsType',
                width: '7rem',
            },
        },
        {
            $Type                : 'UI.DataField',
            Value                : country,
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '7rem',
            },
        },
        {
            $Type: 'UI.DataField',
            Value: createOn,
        },
        {
            $Type: 'UI.DataField',
            Value: deliveryDate
        }
    ],
    UI.FieldGroup #ClientInformation: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: email
            },
            {
                $Type: 'UI.DataField',
                Value: firstName
            },
            {
                $Type: 'UI.DataField',
                Value: lastName
            },
            {
                $Type: 'UI.DataField',
                Value: country
            }
        ]
    },
    UI.FieldGroup #OrderInformation : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: createOn
            },
            {
                $Type: 'UI.DataField',
                Value: deliveryDate
            },
            {
                $Type      : 'UI.DataField',
                Value      : orderStatus_code,
                Criticality: orderStatus.criticality
            }
        ]
    },
    UI.HeaderFacets                 : [
        {
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#ClientInformation',
            Label : 'Client Information'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#OrderInformation',
            Label : 'Order Information'
        }
    ],
    UI.Facets                       : [{
        $Type : 'UI.ReferenceFacet',
        Target: 'toHeader/@UI.LineItem',
        Label : 'Item information'
    }, ]

);
