CREATE DEFINER=`root`@`%` PROCEDURE `AddOrder`(
	/*Sender:*/  con1_Name varchar(70), con1_Surname varchar(45), con1_Telephone varchar(30), ad1_country varchar(45), ad1_region varchar(45), ad1_city varchar(45), ad1_street varchar(45), ad1_buildingNum varchar(45), ad1_additionInfo varchar(256),
	/*Reciver:*/ con2_Name varchar(70), con2_Surname varchar(45), con2_Telephone varchar(30), ad2_country varchar(45), ad2_region varchar(45), ad2_city varchar(45), ad2_street varchar(45), ad2_buildingNum varchar(45), ad2_additionInfo varchar(256),
				 AttachedNotes varchar(1000), order_status varchar(45), delivery_type varchar(45), pickup_type varchar(45)
)
BEGIN
	declare ad1_id int;
    declare ad2_id int;
    
    call AddAddress(ad1_country, ad1_region, ad1_city, ad1_street, ad1_buildingNum, ad1_additionInfo, ad1_id);
	call AddAddress(ad2_country, ad2_region, ad2_city, ad2_street, ad2_buildingNum, ad2_additionInfo, ad2_id);

END