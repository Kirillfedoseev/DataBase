set @parcel_id = 0;
call LogisticCompany.CreateParcel(1, 1, '10.02.2018', 3, 2, 3, 4, @parcel_id);
select @parcel_id;
