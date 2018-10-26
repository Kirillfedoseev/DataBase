/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddCar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AddCar`(out car_id int, latitude double, longitude double)
BEGIN
	declare loc_id int;
    declare veh_id int;
    
    INSERT INTO Location(Latitude,Longitude)
    VALUES(latitude, longitude);
	select last_insert_id() into loc_id;
    
    INSERT INTO Vehicles(idVehicleStatus,idLocation)
	VALUES ('3',loc_id);  /*NoDriver*/
	select last_insert_id() into veh_id;
	
    INSERT INTO Trucks(idVehicles)
	VALUES(veh_id);
	select last_insert_id() into car_id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddContact` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AddContact`( con_Name varchar(70), con_Surname varchar(45), con_Telephone varchar(30), out con_id int)
BEGIN
	insert into Contacts (Telephone, `Name`,`Surname`) 
    values (con_Telephone, con_Name, con_Surname);
    select last_insert_id() into con_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddOrderLoggedIn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AddOrderLoggedIn`( out id_order int, cust_id int,
	/*Sender:*/  con1_Name varchar(70), con1_Surname varchar(70), con1_Telephone varchar(30), ad1_country varchar(70), ad1_region varchar(70), ad1_city varchar(70), ad1_street varchar(70), ad1_buildingNum varchar(70), ad1_additionInfo varchar(1000),
	/*Reciver:*/ con2_Name varchar(70), con2_Surname varchar(70), con2_Telephone varchar(30), ad2_country varchar(70), ad2_region varchar(70), ad2_city varchar(70), ad2_street varchar(70), ad2_buildingNum varchar(70), ad2_additionInfo varchar(1000),
				 AttachedNotes varchar(1000), delivery_type varchar(45), pickup_type varchar(45)
)
BEGIN	
    declare ad1_id int;
    declare con1_id int;
    
    call AddAddress(ad1_country, ad1_region, ad1_city, ad1_street, ad1_buildingNum, ad1_additionInfo, ad1_id);
	    
    call AddContact(con1_Name, con1_Surname, con1_Telephone, con1_id);
		
    call AddOrderWithContactAndAddress(id_order,
    /*Sender:*/  con1_id, ad1_id,
	/*Reciver:*/ con2_Name, con2_Surname, con2_Telephone, ad2_country, ad2_region, ad2_city, ad2_street, ad2_buildingNum, ad2_additionInfo,
				 AttachedNotes, delivery_type, pickup_type);
	
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddOrderLoggedOut` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AddOrderLoggedOut`( out id_order int,
	/*Sender:*/  con1_Name varchar(70), con1_Surname varchar(70), con1_Telephone varchar(30), ad1_country varchar(70), ad1_region varchar(70), ad1_city varchar(70), ad1_street varchar(70), ad1_buildingNum varchar(70), ad1_additionInfo varchar(1000),
	/*Reciver:*/ con2_Name varchar(70), con2_Surname varchar(70), con2_Telephone varchar(30), ad2_country varchar(70), ad2_region varchar(70), ad2_city varchar(70), ad2_street varchar(70), ad2_buildingNum varchar(70), ad2_additionInfo varchar(1000),
				 AttachedNotes varchar(1000), delivery_type varchar(45), pickup_type varchar(45)
)
BEGIN	
    declare ad1_id int;
    declare con1_id int;
    
    call AddAddress(ad1_country, ad1_region, ad1_city, ad1_street, ad1_buildingNum, ad1_additionInfo, ad1_id);	    
    call AddContact(con1_Name, con1_Surname, con1_Telephone, con1_id);
    
	insert into Customer_used_Contacts value (cust_id, con1_id);
    insert into Customer_used_Address value (cust_id,ad1_id);

		
    call AddOrderWithContactAndAddress(id_order,
    /*Sender:*/  con1_id, ad1_id,
	/*Reciver:*/ con2_Name, con2_Surname, con2_Telephone, ad2_country, ad2_region, ad2_city, ad2_street, ad2_buildingNum, ad2_additionInfo,
				 AttachedNotes, delivery_type, pickup_type);
	
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddOrderWithAddress` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AddOrderWithAddress`(out id_order int, cust_id int,
	/*Sender:*/  con1_Name varchar(70), con1_Surname varchar(70), con1_Telephone varchar(30), ad1_id int,
	/*Reciver:*/ con2_Name varchar(70), con2_Surname varchar(70), con2_Telephone varchar(30), ad2_country varchar(70), ad2_region varchar(70), ad2_city varchar(70), ad2_street varchar(70), ad2_buildingNum varchar(70), ad2_additionInfo varchar(1000),
				 AttachedNotes varchar(1000), delivery_type varchar(45), pickup_type varchar(45)
)
BEGIN
	declare con1_id int;
    call AddContact(con1_Name, con1_Surname, con1_Telephone, con1_id);
	
    insert into Customer_used_Contacts value (cust_id, con1_id);
        
    call AddOrderWithContactAndAddress(id_order,
    /*Sender:*/  con1_id, ad1_id,
	/*Reciver:*/ con2_Name, con2_Surname, con2_Telephone, ad2_country, ad2_region, ad2_city, ad2_street, ad2_buildingNum, ad2_additionInfo,
				 AttachedNotes, delivery_type, pickup_type);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddOrderWithContact` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AddOrderWithContact`(out id_order int, cust_id int,
	/*Sender:*/  con1_id int, ad1_country varchar(70), ad1_region varchar(70), ad1_city varchar(70), ad1_street varchar(70), ad1_buildingNum varchar(70), ad1_additionInfo varchar(1000),
	/*Reciver:*/ con2_Name varchar(70), con2_Surname varchar(70), con2_Telephone varchar(30), ad2_country varchar(70), ad2_region varchar(70), ad2_city varchar(70), ad2_street varchar(70), ad2_buildingNum varchar(70), ad2_additionInfo varchar(1000),
				 AttachedNotes varchar(1000), delivery_type varchar(45), pickup_type varchar(45)
)
BEGIN
	declare ad1_id int;
    call AddAddress(ad1_country, ad1_region, ad1_city, ad1_street, ad1_buildingNum, ad1_additionInfo, ad1_id);
	
    insert into Customer_used_Address value (cust_id,ad1_id);
        
    call AddOrderWithContactAndAddress(id_order,
    /*Sender:*/  con1_id, ad1_id,
	/*Reciver:*/ con2_Name, con2_Surname, con2_Telephone, ad2_country, ad2_region, ad2_city, ad2_street, ad2_buildingNum, ad2_additionInfo,
				 AttachedNotes, delivery_type, pickup_type);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddOrderWithContactAndAddress` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AddOrderWithContactAndAddress`(out id_order int,
	/*Sender:*/  con1_id int, ad1_id int,
	/*Reciver:*/ con2_Name varchar(70), con2_Surname varchar(70), con2_Telephone varchar(30), ad2_country varchar(70), ad2_region varchar(70), ad2_city varchar(70), ad2_street varchar(70), ad2_buildingNum varchar(70), ad2_additionInfo varchar(1000),
				 AttachedNotes varchar(1000), delivery_type varchar(45), pickup_type varchar(45)
)
BEGIN
    declare ad2_id int;
    declare con2_id int;
    declare dt int;
    declare pt int;
	
	call AddAddress(ad2_country, ad2_region, ad2_city, ad2_street, ad2_buildingNum, ad2_additionInfo, ad2_id);		
	call AddContact(con2_Name, con2_Surname, con2_Telephone, con2_id);
	
	select idDeliveryType from DeliveryType as d where d.`Type` = delivery_type into dt;
	select idPickUpType from PickUpType as p where p.`Type` = pickup_type into pt;
	
	INSERT INTO Orders
	   (`Sender_idContacts`,
		`Sender_idAddress`,
		`Reciver_idContacts`,
		`Reciever_idAddress`,
		`idOrderStatuses`,
		`idDeliveryType`,
		`idPickUpType`,
		`AttachedNotes`)
	VALUES (con1_id, ad1_id, con2_id, ad2_id, '1', dt, pt, AttachedNotes);
	select last_insert_id() into id_order;	
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddTruck` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AddTruck`(out truck_id int, latitude double, longitude double)
BEGIN
	declare loc_id int;
    declare veh_id int;
    
    INSERT INTO Location(Latitude,Longitude)
    VALUES(latitude, longitude);
	select last_insert_id() into loc_id;
    
    INSERT INTO Vehicles(idVehicleStatus,idLocation)
	VALUES ('3',loc_id);  /*NoDriver*/
	select last_insert_id() into veh_id;
	
    INSERT INTO Trucks(idVehicles)
	VALUES(veh_id);
	select last_insert_id() into truck_id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddWarehouse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AddWarehouse`(
				out warehouse_id int,
				capacity int,
                country varchar(70), 
                region varchar(70), 
                city varchar(70), 
                street varchar(70), 
                buildingNum varchar(70), 
                additionInfo varchar(1000)
			)
BEGIN
	declare ad_id int;
    call AddAddress(country, region, city, street, buildingNum, additionInfo, ad_id);
    
    INSERT INTO WareHouse( `Capacity`, `CurrentLoad`, `Address_idAddress`)
	VALUES (capacity, '0', ad_id);
    
    select last_insert_id() into warehouse_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AppendParcelToPackage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AppendParcelToPackage`(parcel_id int, package_id int)
BEGIN
	 
    INSERT INTO Parcel_in_Package(idPackage, idParcel)
	VALUES (parcel_id, package_id);
    
    UPDATE Parcel
	SET	idParcelState = '3'
	WHERE idParcel = parcel_id;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BlockCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `BlockCustomer`(cust_id int)
BEGIN
	
    UPDATE Customers
	SET	idAccessRights = '9'
	WHERE idCustomer = cust_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BlockEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `BlockEmployee`(empl_id int)
BEGIN
	
    UPDATE `Employees`
	SET	idAccessRights = '9'
	WHERE idEmployees = empl_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CahangeOrderStatusById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `CahangeOrderStatusById`(order_id int, order_status_id int)
BEGIN
	
    update Orders
    set idOrderStatuses = order_status_id
    where IdOrder = order_id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CahangeOrderStatusByName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `CahangeOrderStatusByName`(order_id int, order_status varchar(45))
BEGIN
	
    declare status_id int;
    
    select idOrderStatuses 
    from OrderStatuses 
    where `Status` = order_status
    into status_id;
    
    call CahangeOrderStatusById(order_id, status_id);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreatePackage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `CreatePackage`(out parcel_id int, departure_warehouse int, arrival_warehouse int)
BEGIN
	
    INSERT INTO Package(idPackageState, Departure_idWareHouse, Arrival_idWareHouse)
    VALUES('1', departure_warehouse, arrival_warehouse);
	select last_insert_id() into parcel_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateParcel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `CreateParcel`(
	order_id int, 
	warehouse_id int,
    reciep_date date,
	height float, width float, depth float, weight float, 
    out parcel_id int)
BEGIN
	declare size_id int;
    declare verify_code int;
    
    SELECT FLOOR(RAND()*(899999) + 100000) into verify_code;
    
	INSERT INTO ParcelSizes(Height, Width, Depth, Weight)
	VALUES (height, width, depth, weight);
    select last_insert_id() into size_id;
    
    
	INSERT INTO Parcel (idParcelState, idParcelSizes, Reciept_Date, Verify_Code)
	VALUES ('1', size_id, reciep_date, verify_code);
	select last_insert_id() into parcel_id;
    
    
    INSERT INTO Orders_is_Parcel (idParcel, idOrder)
	VALUES (parcel_id, order_id);
	
    call CahangeOrderStatusById(order_id, '6');
    
    
	INSERT INTO Parcel_at_WareHouse	(idParcel, idWareHouse)
	VALUES (parcel_id, warehouse_id);
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DisbandPackageAtWareHouse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `DisbandPackageAtWareHouse`(package_id int)
BEGIN
	
	UPDATE `LogisticCompany`.`Parcel`
	SET	idParcelState = '1'
	WHERE idParcel in (select idParcel from Parcel_in_Package where idPackage = package_id);
	
    DELETE FROM Parcel_in_Package
	WHERE package_id = idPackage;
    
    DELETE FROM Package
	WHERE package_id = idPackage;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAccessRights` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GetAccessRights`(login varchar(30), passHash varchar(256) , out access varchar(45))
BEGIN
    
    declare a int;
    
	Select e.idAccessRights
	from Employees  as e 
	where e.Login = login and e.PassHash = passHash
	into a;
    
    select access_role from AccessRights as r 
    where a =  r.idAccessRights
    into access;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetOrders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GetOrders`()
BEGIN
    
	SELECT       idOrder, 
	/*Sender:*/  con1.`Name`, con1.Surname, con1.Telephone, ad1.Country, ad1.Region, ad1.City, ad1.Street, ad1.BuildingNum, ad1.AdditionInfo, 
	/*Reciver:*/ con2.`Name`, con2.Surname, con2.Telephone, ad2.Country, ad2.Region, ad2.City, ad2.Street, ad2.BuildingNum, ad2.AdditionInfo , 
				 AttachedNotes, `Status`, dt.`Type`, pt.`Type`
    FROM (((((((Orders as o 
    inner join OrderStatuses as os on os.idOrderStatuses = o.idOrderStatuses)
    inner join Address as ad1 on ad1.idAddress = o.Reciever_idAddress)
    inner join Address as ad2 on ad2.idAddress = o.Sender_idAddress)
    inner join DeliveryType as dt on dt.idDeliveryType = o.idDeliveryType)
	inner join PickUpType as pt on pt.idPickUpType = o.idPickUpType)
    inner join Contacts as con1 on o.Sender_idContacts = con1.idContacts)
	inner join Contacts as con2 on o.Reciver_idContacts = con2.idContacts);

    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetOrdersOfCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GetOrdersOfCustomer`(customer_data_id int)
BEGIN
	
    SELECT       idOrder, 
	/*Sender:*/  con1.`Name`, con1.Surname, con1.Telephone, ad1.Country, ad1.Region, ad1.City, ad1.Street, ad1.BuildingNum, ad1.AdditionInfo, 
	/*Reciver:*/ con2.`Name`, con2.Surname, con2.Telephone, ad2.Country, ad2.Region, ad2.City, ad2.Street, ad2.BuildingNum, ad2.AdditionInfo , 
				 AttachedNotes, `Status`, dt.`Type`, pt.`Type`
    FROM ((((((((select * from Orders where o.idOrder in (select idOrder from Customer_has_Orders where customer_data_id = idCustomerData)) as o 
    inner join OrderStatuses as os on os.idOrderStatuses = o.idOrderStatuses)
    inner join Address as ad1 on ad1.idAddress = o.Reciever_idAddress)
    inner join Address as ad2 on ad2.idAddress = o.Sender_idAddress)
    inner join DeliveryType as dt on dt.idDeliveryType = o.idDeliveryType)
	inner join PickUpType as pt on pt.idPickUpType = o.idPickUpType)
    inner join Contacts as con1 on o.Sender_idContacts = con1.idContacts)
	inner join Contacts as con2 on o.Reciver_idContacts = con2.idContacts);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetOrdersOnValidating` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GetOrdersOnValidating`()
BEGIN
    
	SELECT       idOrder, 
	/*Sender:*/  con1.`Name`, con1.Surname, con1.Telephone, ad1.Country, ad1.Region, ad1.City, ad1.Street, ad1.BuildingNum, ad1.AdditionInfo, 
	/*Reciver:*/ con2.`Name`, con2.Surname, con2.Telephone, ad2.Country, ad2.Region, ad2.City, ad2.Street, ad2.BuildingNum, ad2.AdditionInfo , 
				 AttachedNotes, `Status`, dt.`Type`, pt.`Type`
    FROM (((((((Orders as o 
    inner join OrderStatuses as os on os.idOrderStatuses = o.idOrderStatuses)
    inner join Address as ad1 on ad1.idAddress = o.Reciever_idAddress)
    inner join Address as ad2 on ad2.idAddress = o.Sender_idAddress)
    inner join DeliveryType as dt on dt.idDeliveryType = o.idDeliveryType)
	inner join PickUpType as pt on pt.idPickUpType = o.idPickUpType)
    inner join Contacts as con1 on o.Sender_idContacts = con1.idContacts)
	inner join Contacts as con2 on o.Reciver_idContacts = con2.idContacts)
    where `Status` = 'OnValidating';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetParcel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GetParcel`(parcel_id int)
BEGIN	

    SELECT idParcel, ps.`Status` , Reciept_Date, Arrival_Date, Verify_Code, size.Volume, size.Height, size.Width, size.Depth, size.Weight
    from (select * FROM Parcel WHERE Parcel.idParcel = parcel_id) as p
    inner join ParcelState as ps on p.idParcelState = ps.idParcelState
    inner join ParcelSizes as size on p.idParcelSizes = size.idParcelSizes;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetParcelsInPackage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GetParcelsInPackage`(package_id int)
BEGIN
	
    SELECT idParcel, ps.`Status` , Reciept_Date, Arrival_Date, Verify_Code, size.Volume, size.Height, size.Width, size.Depth, size.Weight
    from (
			select * 
            FROM Parcel 
            WHERE Parcel.idParcel in (
										select idPacel 
                                        from Parcel_in_Package 
                                        where idPackage = package_id
									 )
		  ) as p
    inner join ParcelState as ps on p.idParcelState = ps.idParcelState
    inner join ParcelSizes as size on p.idParcelSizes = size.idParcelSizes;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetWareHouses` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GetWareHouses`()
BEGIN

	SELECT w.idWareHouse, w.Capacity, w.CurrentLoad, 
		   a.Country, a.Region, a.City, a.Street, a.BuildingNum, a.AdditionInfo
    FROM WareHouse as w
    inner join Address as a on a.idAddress = w.idAddress;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegisterCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `RegisterCustomer`(out cust_id int, login varchar(30), passHash varchar(256), accessLevel int)
BEGIN
	declare st_id int;
    declare cd_id int;
    
    insert into Customer_Statistics values ();
    select last_insert_id() into st_id;
	
    insert into Customers_Data(`Customers_Data`) values (st_id);
	select last_insert_id() into cd_id;
	
    INSERT INTO Customers
	   (`idCustomerData`,
		`Login`,
		`PassHash`,
		`idAccessRights`)
	VALUES (cd_id, login, passHash, accessLevel);
    
    select last_insert_id() into cust_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegisterEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `RegisterEmployee`(out empl_id int,login varchar(30), passHash varchar(256), accessLevel int)
BEGIN
	
    INSERT INTO Employees (`Login`,`PassHash`,`idAccessRights`)
	VALUES (login, passHash, accessLevel);
    
    select last_insert_id() into empl_id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SendPackageWithTruck` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `SendPackageWithTruck`(package_id int, truck_id int)
BEGIN

	UPDATE Package
	SET	idPackageState = '2'
	WHERE idPackage = package_id;

	INSERT INTO Package_is_transfering(Package_idPackage, Trucks_idTruck)
	VALUES(package_id, truck_id);
	
   

    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-21 18:15:22
