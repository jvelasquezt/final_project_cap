using {FinalProject as services} from '../service';

annotate services.Items with {
    ID               @title: 'Id Item';
    name             @title: 'Name';
    description      @title: 'Description';
    releaseDate      @title: 'Release Date';
    discontinuedDate @title: 'Discontinued Date';
    price            @title: 'Price'          @Measures.ISOCurrency: currencyCode_code;
    currencyCode     @title: 'Currency Code'  @Common.IsCurrency;
    height           @title: 'Height'         @Measures.Unit       : unitOfMeasure;
    width            @title: 'Width'          @Measures.Unit       : unitOfMeasure;
    depth            @title: 'Depth'          @Measures.Unit       : unitOfMeasure;
    quantity         @title: 'Quantity';
    unitOfMeasure    @title: 'Unit Measure'   @Common.IsUnit;
};

annotate services.Items with @(
    UI.HeaderInfo       : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Item',
        TypeNamePlural: 'Items',
        Title         : {
            $Type: 'UI.DataField',
            Value: ID,
        },
        Description   : {Value: `Item's data`}
    },
    Common.SemanticKey  : [ID],
    UI.SelectionFields  : [currencyCode_code, ],
    UI.LineItem         : [
        {
            $Type                : 'UI.DataField',
            Value                : ID,
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '7rem',
            },
        },
        {
            $Type: 'UI.DataField',
            Value: name,
        },
        {
            $Type: 'UI.DataField',
            Value: description,
        },
        {
            $Type: 'UI.DataField',
            Value: price,
        },
        /* {
            $Type: 'UI.DataField',
            Value: currencyCode_code,
        }, */
        // {
        //     $Type: 'UI.DataField',
        //     Value: unitOfMeasure,
        // },
        {
            $Type                : 'UI.DataField',
            Value                : quantity,
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '5rem',
            },
        },
        {
            $Type: 'UI.DataField',
            Value: releaseDate,
        },
        {
            $Type: 'UI.DataField',
            Value: discontinuedDate,
        },
        {
            $Type: 'UI.DataField',
            Value: height,
        },
        {
            $Type: 'UI.DataField',
            Value: width,
        },
        {
            $Type: 'UI.DataField',
            Value: depth
        }
    ],
    UI.FieldGroup #Items: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: ID
            },
            {
                $Type: 'UI.DataField',
                Value: name
            },
            {
                $Type: 'UI.DataField',
                Value: description
            },
            {
                $Type: 'UI.DataField',
                Value: price
            },
            {
                $Type: 'UI.DataField',
                Value: currencyCode_code
            },
            {
                $Type: 'UI.DataField',
                Value: quantity
            },
            {
                $Type: 'UI.DataField',
                Value: unitOfMeasure
            },
            {
                $Type: 'UI.DataField',
                Value: releaseDate
            },
            {
                $Type: 'UI.DataField',
                Value: discontinuedDate
            },
            {
                $Type: 'UI.DataField',
                Value: height
            },
            {
                $Type: 'UI.DataField',
                Value: width
            },
            {
                $Type: 'UI.DataField',
                Value: depth
            }
        ]
    },
    UI.Facets           : [{
        $Type : 'UI.ReferenceFacet',
        Target: '@UI.FieldGroup#Items',
        Label : 'Items'
    }]
);
