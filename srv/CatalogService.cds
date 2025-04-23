using { vishnu.db.master, vishnu.db.transaction } from '../db/datamodel';
using { cappo.cds.CDSViews } from '../db/CDSviews';


service CatalogService @(path:'CatalogService') {

    entity EmployeeSet as projection on master.employees;
    entity AddressSet as projection on master.address;
    entity BusinessPartnerSet as projection on master.businesspartner;
    entity ProductSet as projection on master.product;
    entity POs @(odata.draft.enabled: true)
    as projection on transaction.purchaseorder{
        *,
        case OVERALL_STATUS
            when 'P' then 'Pending'
            when 'D' then 'Delivered'
            when 'A' then 'Approved'
            when 'X' then 'Rejected'
                end as OverallStatus : String(10)@(title : '{i18n>OVERALL_STATUS}'),
        case OVERALL_STATUS
            when 'P' then 2
            when 'D' then 2
            when 'A' then 3
            when 'X' then 1
                end as IconColor : Integer
    }
        actions{
        action boost() returns POs
    };
    entity POItems as projection on transaction.poitems;

    function getLargestOrder() returns POs;
}
