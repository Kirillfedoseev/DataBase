CREATE DEFINER=`root`@`%` PROCEDURE `GetOrders`()
BEGIN
    

    
	SELECT       idOrder, 
	/*Sender:*/  con1.`Name`, con1.Surname, con1.Telephone, ad1.Country, ad1.Region, ad1.City, ad1.Street, ad1.BuildingNum, ad1.AdditionInfo, 
	/*Reciver:*/ con2.`Name`, con2.Surname, con2.Telephone, ad2.Country, ad2.Region, ad2.City, ad2.Street, ad2.BuildingNum, ad2.AdditionInfo , 
				 AttachedNotes, `Status`, dt.`Type`, pt.`Type`
    FROM ((((((((Orders as o 
    inner join CustomersData as c on o.CustomersData_idCustomer = c.idCustomer)
    inner join OrderStatuses as os on os.idOrderStatuses = o.OrderStatuses_idOrderStatuses)
    inner join Address as ad1 on ad1.idAddress = o.Reciever_idAddress)
    inner join Address as ad2 on ad2.idAddress = o.Sender_idAddress)
    inner join DeliveryType as dt on dt.idDeliveryType = o.DeliveryType_idDeliveryType)
	inner join PickUpType as pt on pt.idPickUpType = o.PickUpType_idPickUpType)
    inner join Contacts as con1 on c.Contacts_idContacts = con1.idContacts)
	inner join Contacts as con2 on o.Reciver_idContacts = con2.idContacts);

    
END