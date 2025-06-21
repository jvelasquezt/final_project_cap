namespace final_project;

using {
    sap.common.Currencies,
    sap.common.CodeList
} from '@sap/cds/common';


entity Header {
    key ID           : String(36);
        email        : String(30);
        firstName    : String(30);
        lastName     : String;
        // country      : Association to Countries;
        country : String(30);
        createOn     : Date;
        deliveryDate : Date;
        orderStatus  : Association to Status;
        imageUrl     : String;
        toHeader     : Composition of many Items
                           on toHeader.idItems = $self;
}

entity Items {
    key ID               : String(36);
        name             : String(40);
        description      : String(40);
        releaseDate      : Date;
        discontinuedDate : Date;
        price            : Decimal(12, 2);
        currencyCode     : Association to Currencies;
        height           : Decimal(15, 3);
        width            : Decimal(13, 3);
        depth            : Decimal(12, 2);
        quantity         : Decimal(16, 2);
        unitOfMeasure    : String(2) default 'IN';
    key idItems          : Association to Header;
}

entity Status : CodeList {
    key code        : String(20) enum {
            Accepted = 'Order Accepted';
            Opened = 'Order Opened';
            Rejected = 'Order Rejected';
        };
        criticality : Integer;
}
