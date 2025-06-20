using {FinalProject as services} from '../service';

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

annotate services.Header with @(
    UI.HeaderInfo                   : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Sell Order',
        TypeNamePlural: 'Sell Orders',
        ImageUrl : imageUrl,
        Title         : {
            $Type: 'UI.DataField',
            Value: ID,
        }
    },

    UI.SelectionFields              : [
        orderStatus_code,
        country_code
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
            Value                : country_code,
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
                Value: country_code
            }
        ]
    },
        UI.FieldGroup #OrderInformation: {
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
                $Type: 'UI.DataField',
                Value: orderStatus_code,
                Criticality: orderStatus.criticality
            }
        ]
    },
    UI.HeaderFacets:[
        {
            $Type: 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#ClientInformation',
            Label : 'Client Information'
        },
        {
            $Type: 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#OrderInformation',
            Label : 'Order Information'
        }
    ]

);
  