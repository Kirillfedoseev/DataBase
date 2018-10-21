CREATE DATABASE  IF NOT EXISTS `LogisticCompany` /*!40100 DEFAULT CHARACTER SET utf16 */;
USE `LogisticCompany`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: 10.90.138.29    Database: LogisticCompany
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AccessRights`
--

DROP TABLE IF EXISTS `AccessRights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `AccessRights` (
  `idAccessRights` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `access_role` varchar(45) NOT NULL DEFAULT 'Customer',
  PRIMARY KEY (`idAccessRights`),
  UNIQUE KEY `idAccessRights_UNIQUE` (`idAccessRights`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AccessRights`
--

LOCK TABLES `AccessRights` WRITE;
/*!40000 ALTER TABLE `AccessRights` DISABLE KEYS */;
INSERT INTO `AccessRights` VALUES (1,'Customer'),(2,'SysAdmin'),(3,'SiteAdmin'),(4,'TopManager'),(5,'OrderOperator'),(6,'ControllOperator'),(7,'TruckDriver'),(8,'DeliveryOperator'),(9,'Blocked');
/*!40000 ALTER TABLE `AccessRights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Address` (
  `idAddress` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Country` varchar(70) NOT NULL,
  `Region` varchar(70) NOT NULL,
  `City` varchar(70) NOT NULL,
  `Street` varchar(70) NOT NULL,
  `BuildingNum` varchar(70) NOT NULL,
  `AdditionInfo` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`idAddress`),
  UNIQUE KEY `idAddress_UNIQUE` (`idAddress`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
INSERT INTO `Address` VALUES (1,'Россия','Воронежская область','Воронеж','Ленинский проспект','73','кв. 71'),(2,'Россия','Республика Татарстан','Иннополис','Университесткая ','1','корп 1, кв 411'),(3,'Россия','Воронежская область','Воронеж','Ленинский проспект','73','кв. 71'),(4,'Россия','Республика Татарстан','Иннополис','Университесткая ','1','корп 1, кв 411'),(5,'Россия','Республика Татарстан','Казань','Разъезд Восстания','42','склад 1'),(8,'Россия','Воронежская Область','Воронеж','Репненская','4','склад 7'),(9,'Россия','Воронежская Область','Воронеж','Репненская','4','склад 7'),(13,'Беларусь','Гомельская область','Гомель','Ленинская','56','склад 6');
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cars`
--

DROP TABLE IF EXISTS `Cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Cars` (
  `idCar` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idVehicles` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idCar`),
  UNIQUE KEY `idCar_UNIQUE` (`idCar`),
  KEY `fk_Cars_Vehicles1_idx` (`idVehicles`),
  CONSTRAINT `fk_Cars_Vehicles1` FOREIGN KEY (`idVehicles`) REFERENCES `Vehicles` (`idvehicles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cars`
--

LOCK TABLES `Cars` WRITE;
/*!40000 ALTER TABLE `Cars` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contacts`
--

DROP TABLE IF EXISTS `Contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Contacts` (
  `idContacts` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Telephone` varchar(30) NOT NULL,
  `Name` varchar(70) NOT NULL,
  `Surname` varchar(70) NOT NULL,
  PRIMARY KEY (`idContacts`),
  UNIQUE KEY `idContacts_UNIQUE` (`idContacts`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contacts`
--

LOCK TABLES `Contacts` WRITE;
/*!40000 ALTER TABLE `Contacts` DISABLE KEYS */;
INSERT INTO `Contacts` VALUES (1,'+79103476717','Кирилл','Федосеев'),(2,'+79961230101','Кирилл','Федосеев'),(3,'+79103476717','Кирилл','Федосеев'),(4,'+79961230101','Кирилл','Федосеев');
/*!40000 ALTER TABLE `Contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer_Statistics`
--

DROP TABLE IF EXISTS `Customer_Statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Customer_Statistics` (
  `idStatistics` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Orders_Completed` int(10) unsigned zerofill NOT NULL,
  `Orders_Failed` int(10) unsigned zerofill NOT NULL,
  `Average_Satisfaction` decimal(10,0) unsigned zerofill NOT NULL,
  PRIMARY KEY (`idStatistics`),
  UNIQUE KEY `idStatistics_UNIQUE` (`idStatistics`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer_Statistics`
--

LOCK TABLES `Customer_Statistics` WRITE;
/*!40000 ALTER TABLE `Customer_Statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `Customer_Statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer_has_Orders`
--

DROP TABLE IF EXISTS `Customer_has_Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Customer_has_Orders` (
  `idCustomerData` int(10) unsigned NOT NULL,
  `idOrder` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idCustomerData`,`idOrder`),
  UNIQUE KEY `idCustomerData_UNIQUE` (`idCustomerData`),
  KEY `fk_Customers_Data_has_Orders_Orders1_idx` (`idOrder`),
  KEY `fk_Customers_Data_has_Orders_Customers_Data1_idx` (`idCustomerData`),
  CONSTRAINT `fk_Customers_Data_has_Orders_Customers_Data1` FOREIGN KEY (`idCustomerData`) REFERENCES `Customers_Data` (`idcustomerdata`),
  CONSTRAINT `fk_Customers_Data_has_Orders_Orders1` FOREIGN KEY (`idOrder`) REFERENCES `Orders` (`idorder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer_has_Orders`
--

LOCK TABLES `Customer_has_Orders` WRITE;
/*!40000 ALTER TABLE `Customer_has_Orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `Customer_has_Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer_used_Address`
--

DROP TABLE IF EXISTS `Customer_used_Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Customer_used_Address` (
  `idCustomerData` int(10) unsigned NOT NULL,
  `idAddress` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idCustomerData`,`idAddress`),
  KEY `fk_Customers_Data_has_Address_Address1_idx` (`idAddress`),
  KEY `fk_Customers_Data_has_Address_Customers_Data1_idx` (`idCustomerData`),
  CONSTRAINT `fk_Customers_Data_has_Address_Address1` FOREIGN KEY (`idAddress`) REFERENCES `Address` (`idaddress`),
  CONSTRAINT `fk_Customers_Data_has_Address_Customers_Data1` FOREIGN KEY (`idCustomerData`) REFERENCES `Customers_Data` (`idcustomerdata`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer_used_Address`
--

LOCK TABLES `Customer_used_Address` WRITE;
/*!40000 ALTER TABLE `Customer_used_Address` DISABLE KEYS */;
/*!40000 ALTER TABLE `Customer_used_Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer_used_Contacts`
--

DROP TABLE IF EXISTS `Customer_used_Contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Customer_used_Contacts` (
  `idCustomerData` int(10) unsigned NOT NULL,
  `idContacts` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idCustomerData`,`idContacts`),
  KEY `fk_Customers_Data_has_Contacts_Contacts1_idx` (`idContacts`),
  KEY `fk_Customers_Data_has_Contacts_Customers_Data1_idx` (`idCustomerData`),
  CONSTRAINT `fk_Customers_Data_has_Contacts_Contacts1` FOREIGN KEY (`idContacts`) REFERENCES `Contacts` (`idcontacts`),
  CONSTRAINT `fk_Customers_Data_has_Contacts_Customers_Data1` FOREIGN KEY (`idCustomerData`) REFERENCES `Customers_Data` (`idcustomerdata`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer_used_Contacts`
--

LOCK TABLES `Customer_used_Contacts` WRITE;
/*!40000 ALTER TABLE `Customer_used_Contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `Customer_used_Contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Customers` (
  `idCustomer` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idCustomerData` int(10) unsigned NOT NULL,
  `Login` varchar(30) NOT NULL,
  `PassHash` varchar(256) NOT NULL,
  `idAccessRights` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idCustomer`),
  UNIQUE KEY `idEmployees_UNIQUE` (`idCustomer`),
  KEY `fk_Employees_AccessRights_idx` (`idAccessRights`),
  KEY `fk_Customers_Customers_Data1_idx` (`idCustomerData`),
  CONSTRAINT `fk_Customers_Customers_Data1` FOREIGN KEY (`idCustomerData`) REFERENCES `Customers_Data` (`idcustomerdata`),
  CONSTRAINT `fk_Employees_AccessRights0` FOREIGN KEY (`idAccessRights`) REFERENCES `AccessRights` (`idaccessrights`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customers_Data`
--

DROP TABLE IF EXISTS `Customers_Data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Customers_Data` (
  `idCustomerData` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idStatistics` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idCustomerData`),
  UNIQUE KEY `idCustomer_UNIQUE` (`idCustomerData`),
  KEY `fk_CustomersData_Statistics1_idx` (`idStatistics`),
  CONSTRAINT `fk_CustomersData_Statistics1` FOREIGN KEY (`idStatistics`) REFERENCES `Customer_Statistics` (`idstatistics`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers_Data`
--

LOCK TABLES `Customers_Data` WRITE;
/*!40000 ALTER TABLE `Customers_Data` DISABLE KEYS */;
/*!40000 ALTER TABLE `Customers_Data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeliveryType`
--

DROP TABLE IF EXISTS `DeliveryType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `DeliveryType` (
  `idDeliveryType` int(10) unsigned NOT NULL,
  `Type` varchar(45) NOT NULL DEFAULT 'Ordinary',
  PRIMARY KEY (`idDeliveryType`),
  UNIQUE KEY `idOrderStatuses_UNIQUE` (`idDeliveryType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeliveryType`
--

LOCK TABLES `DeliveryType` WRITE;
/*!40000 ALTER TABLE `DeliveryType` DISABLE KEYS */;
INSERT INTO `DeliveryType` VALUES (1,'Ordinary'),(2,'Express');
/*!40000 ALTER TABLE `DeliveryType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employees`
--

DROP TABLE IF EXISTS `Employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Employees` (
  `idEmployees` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Login` varchar(30) NOT NULL,
  `PassHash` varchar(256) NOT NULL,
  `idAccessRights` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idEmployees`),
  UNIQUE KEY `idEmployees_UNIQUE` (`idEmployees`),
  KEY `fk_Employees_AccessRights_idx` (`idAccessRights`),
  CONSTRAINT `fk_Employees_AccessRights` FOREIGN KEY (`idAccessRights`) REFERENCES `AccessRights` (`idaccessrights`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employees`
--

LOCK TABLES `Employees` WRITE;
/*!40000 ALTER TABLE `Employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `Employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Location` (
  `idLocation` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Latitude` double unsigned zerofill NOT NULL,
  `Longitude` double unsigned zerofill NOT NULL,
  PRIMARY KEY (`idLocation`),
  UNIQUE KEY `idLocation_UNIQUE` (`idLocation`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Location`
--

LOCK TABLES `Location` WRITE;
/*!40000 ALTER TABLE `Location` DISABLE KEYS */;
INSERT INTO `Location` VALUES (1,0000000000000000005.33,0000000000000000006.11),(2,0000000000000000005.33,0000000000000000006.11),(3,0000000000000000007.33,0000000000000000023.11);
/*!40000 ALTER TABLE `Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderStatuses`
--

DROP TABLE IF EXISTS `OrderStatuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `OrderStatuses` (
  `idOrderStatuses` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Status` varchar(45) NOT NULL DEFAULT 'Error',
  PRIMARY KEY (`idOrderStatuses`),
  UNIQUE KEY `idOrderStatuses_UNIQUE` (`idOrderStatuses`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderStatuses`
--

LOCK TABLES `OrderStatuses` WRITE;
/*!40000 ALTER TABLE `OrderStatuses` DISABLE KEYS */;
INSERT INTO `OrderStatuses` VALUES (1,'OnValidating'),(2,'Approved'),(3,'Rejected'),(4,'Completed'),(5,'Canceled'),(6,'Delivering');
/*!40000 ALTER TABLE `OrderStatuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Orders` (
  `idOrder` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Sender_idContacts` int(10) unsigned NOT NULL,
  `Sender_idAddress` int(10) unsigned NOT NULL,
  `Reciver_idContacts` int(10) unsigned NOT NULL,
  `Reciever_idAddress` int(10) unsigned NOT NULL,
  `idOrderStatuses` int(10) unsigned NOT NULL,
  `idDeliveryType` int(10) unsigned NOT NULL,
  `idPickUpType` int(10) unsigned NOT NULL,
  `AttachedNotes` varchar(1000) NOT NULL DEFAULT 'No comments',
  PRIMARY KEY (`idOrder`),
  UNIQUE KEY `idOrder_UNIQUE` (`idOrder`),
  KEY `fk_Order_OrderStatuses1_idx` (`idOrderStatuses`),
  KEY `fk_Order_Address1_idx` (`Reciever_idAddress`),
  KEY `fk_Order_Address2_idx` (`Sender_idAddress`),
  KEY `fk_Order_DeliveryType1_idx` (`idDeliveryType`),
  KEY `fk_Order_PickUpType1_idx` (`idPickUpType`),
  KEY `fk_Orders_Contacts1_idx` (`Reciver_idContacts`),
  KEY `fk_Orders_Contacts2_idx` (`Sender_idContacts`),
  CONSTRAINT `fk_Order_Address1` FOREIGN KEY (`Reciever_idAddress`) REFERENCES `Address` (`idaddress`),
  CONSTRAINT `fk_Order_Address2` FOREIGN KEY (`Sender_idAddress`) REFERENCES `Address` (`idaddress`),
  CONSTRAINT `fk_Order_DeliveryType1` FOREIGN KEY (`idDeliveryType`) REFERENCES `DeliveryType` (`iddeliverytype`),
  CONSTRAINT `fk_Order_OrderStatuses1` FOREIGN KEY (`idOrderStatuses`) REFERENCES `OrderStatuses` (`idorderstatuses`),
  CONSTRAINT `fk_Order_PickUpType1` FOREIGN KEY (`idPickUpType`) REFERENCES `PickUpType` (`idpickuptype`),
  CONSTRAINT `fk_Orders_Contacts1` FOREIGN KEY (`Reciver_idContacts`) REFERENCES `Contacts` (`idcontacts`),
  CONSTRAINT `fk_Orders_Contacts2` FOREIGN KEY (`Sender_idContacts`) REFERENCES `Contacts` (`idcontacts`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,3,3,4,4,6,2,1,'Как можно быстрее');
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders_is_Parcel`
--

DROP TABLE IF EXISTS `Orders_is_Parcel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Orders_is_Parcel` (
  `idParcel` int(10) unsigned NOT NULL,
  `idOrder` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idParcel`,`idOrder`),
  KEY `fk_Orders_has_Parcel_Parcel1_idx` (`idParcel`),
  KEY `fk_Orders_has_Parcel_Orders1_idx` (`idOrder`),
  CONSTRAINT `fk_Orders_has_Parcel_Orders1` FOREIGN KEY (`idOrder`) REFERENCES `Orders` (`idorder`),
  CONSTRAINT `fk_Orders_has_Parcel_Parcel1` FOREIGN KEY (`idParcel`) REFERENCES `Parcel` (`idparcel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders_is_Parcel`
--

LOCK TABLES `Orders_is_Parcel` WRITE;
/*!40000 ALTER TABLE `Orders_is_Parcel` DISABLE KEYS */;
INSERT INTO `Orders_is_Parcel` VALUES (1,1),(2,1);
/*!40000 ALTER TABLE `Orders_is_Parcel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Package`
--

DROP TABLE IF EXISTS `Package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Package` (
  `idPackage` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Departure_idWareHouse` int(10) unsigned NOT NULL,
  `Arrival_idWareHouse` int(10) unsigned NOT NULL,
  `idPackageState` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idPackage`),
  UNIQUE KEY `idPackage_UNIQUE` (`idPackage`),
  KEY `fk_Package_WareHouse1_idx` (`Departure_idWareHouse`),
  KEY `fk_Package_WareHouse2_idx` (`Arrival_idWareHouse`),
  KEY `fk_Package_PackageState1_idx` (`idPackageState`),
  CONSTRAINT `fk_Package_PackageState1` FOREIGN KEY (`idPackageState`) REFERENCES `PackageState` (`idpackagestate`),
  CONSTRAINT `fk_Package_WareHouse1` FOREIGN KEY (`Departure_idWareHouse`) REFERENCES `WareHouse` (`idwarehouse`),
  CONSTRAINT `fk_Package_WareHouse2` FOREIGN KEY (`Arrival_idWareHouse`) REFERENCES `WareHouse` (`idwarehouse`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Package`
--

LOCK TABLES `Package` WRITE;
/*!40000 ALTER TABLE `Package` DISABLE KEYS */;
INSERT INTO `Package` VALUES (1,1,2,0);
/*!40000 ALTER TABLE `Package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PackageState`
--

DROP TABLE IF EXISTS `PackageState`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `PackageState` (
  `idPackageState` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Status` varchar(45) NOT NULL,
  PRIMARY KEY (`idPackageState`),
  UNIQUE KEY `idParcelState_UNIQUE` (`idPackageState`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PackageState`
--

LOCK TABLES `PackageState` WRITE;
/*!40000 ALTER TABLE `PackageState` DISABLE KEYS */;
INSERT INTO `PackageState` VALUES (1,'AtWareHouse'),(2,'Transfering'),(3,'Arrived');
/*!40000 ALTER TABLE `PackageState` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Package_is_transfering`
--

DROP TABLE IF EXISTS `Package_is_transfering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Package_is_transfering` (
  `Package_idPackage` int(10) unsigned NOT NULL,
  `Trucks_idTruck` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Package_idPackage`,`Trucks_idTruck`),
  UNIQUE KEY `Package_idPackage_UNIQUE` (`Package_idPackage`),
  UNIQUE KEY `Trucks_idTruck_UNIQUE` (`Trucks_idTruck`),
  KEY `fk_Package_has_Trucks_Trucks1_idx` (`Trucks_idTruck`),
  KEY `fk_Package_has_Trucks_Package1_idx` (`Package_idPackage`),
  CONSTRAINT `fk_Package_has_Trucks_Package1` FOREIGN KEY (`Package_idPackage`) REFERENCES `Package` (`idpackage`),
  CONSTRAINT `fk_Package_has_Trucks_Trucks1` FOREIGN KEY (`Trucks_idTruck`) REFERENCES `Trucks` (`idtruck`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Package_is_transfering`
--

LOCK TABLES `Package_is_transfering` WRITE;
/*!40000 ALTER TABLE `Package_is_transfering` DISABLE KEYS */;
/*!40000 ALTER TABLE `Package_is_transfering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Parcel`
--

DROP TABLE IF EXISTS `Parcel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Parcel` (
  `idParcel` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idParcelState` int(10) unsigned NOT NULL,
  `idParcelSizes` int(10) unsigned NOT NULL,
  `Reciept_Date` date NOT NULL,
  `Arrival_Date` date DEFAULT NULL,
  `Verify_Code` int(11) NOT NULL,
  PRIMARY KEY (`idParcel`),
  UNIQUE KEY `idParcel_UNIQUE` (`idParcel`),
  KEY `fk_Parcel_ParcelSizes1_idx` (`idParcelSizes`),
  KEY `fk_Parcel_ParcelState1_idx` (`idParcelState`),
  CONSTRAINT `fk_Parcel_ParcelSizes1` FOREIGN KEY (`idParcelSizes`) REFERENCES `ParcelSizes` (`idparcelsizes`),
  CONSTRAINT `fk_Parcel_ParcelState1` FOREIGN KEY (`idParcelState`) REFERENCES `ParcelState` (`idparcelstate`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Parcel`
--

LOCK TABLES `Parcel` WRITE;
/*!40000 ALTER TABLE `Parcel` DISABLE KEYS */;
INSERT INTO `Parcel` VALUES (1,1,2,'2010-02-20',NULL,583164),(2,1,3,'2010-02-20',NULL,634009);
/*!40000 ALTER TABLE `Parcel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ParcelSizes`
--

DROP TABLE IF EXISTS `ParcelSizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ParcelSizes` (
  `idParcelSizes` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Height` float unsigned zerofill NOT NULL,
  `Width` float unsigned zerofill NOT NULL,
  `Depth` float unsigned zerofill NOT NULL,
  `Weight` float unsigned zerofill NOT NULL,
  `Volume` float GENERATED ALWAYS AS (((`Height` * `Width`) * `Depth`)) VIRTUAL,
  PRIMARY KEY (`idParcelSizes`),
  UNIQUE KEY `idParcelSizes_UNIQUE` (`idParcelSizes`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ParcelSizes`
--

LOCK TABLES `ParcelSizes` WRITE;
/*!40000 ALTER TABLE `ParcelSizes` DISABLE KEYS */;
INSERT INTO `ParcelSizes` (`idParcelSizes`, `Height`, `Width`, `Depth`, `Weight`) VALUES (1,000000000003,000000000002,000000000003,000000000004),(2,000000000003,000000000002,000000000003,000000000004),(3,000000000003,000000000002,000000000003,000000000004);
/*!40000 ALTER TABLE `ParcelSizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ParcelState`
--

DROP TABLE IF EXISTS `ParcelState`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ParcelState` (
  `idParcelState` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Status` varchar(45) NOT NULL,
  PRIMARY KEY (`idParcelState`),
  UNIQUE KEY `idParcelState_UNIQUE` (`idParcelState`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ParcelState`
--

LOCK TABLES `ParcelState` WRITE;
/*!40000 ALTER TABLE `ParcelState` DISABLE KEYS */;
INSERT INTO `ParcelState` VALUES (1,'AtWareHouse'),(2,'Delivering'),(3,'InPackage');
/*!40000 ALTER TABLE `ParcelState` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Parcel_at_WareHouse`
--

DROP TABLE IF EXISTS `Parcel_at_WareHouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Parcel_at_WareHouse` (
  `idParcel` int(10) unsigned NOT NULL,
  `idWareHouse` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idParcel`,`idWareHouse`),
  KEY `fk_Parcel_has_WareHouse_WareHouse1_idx` (`idWareHouse`),
  KEY `fk_Parcel_has_WareHouse_Parcel1_idx` (`idParcel`),
  CONSTRAINT `fk_Parcel_has_WareHouse_Parcel1` FOREIGN KEY (`idParcel`) REFERENCES `Parcel` (`idparcel`),
  CONSTRAINT `fk_Parcel_has_WareHouse_WareHouse1` FOREIGN KEY (`idWareHouse`) REFERENCES `WareHouse` (`idwarehouse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Parcel_at_WareHouse`
--

LOCK TABLES `Parcel_at_WareHouse` WRITE;
/*!40000 ALTER TABLE `Parcel_at_WareHouse` DISABLE KEYS */;
INSERT INTO `Parcel_at_WareHouse` VALUES (2,1);
/*!40000 ALTER TABLE `Parcel_at_WareHouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Parcel_in_Package`
--

DROP TABLE IF EXISTS `Parcel_in_Package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Parcel_in_Package` (
  `idPackage` int(10) unsigned NOT NULL,
  `idParcel` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idPackage`,`idParcel`),
  UNIQUE KEY `idParcel_UNIQUE` (`idParcel`),
  KEY `fk_Package_has_Parcel_Parcel1_idx` (`idParcel`),
  KEY `fk_Package_has_Parcel_Package1_idx` (`idPackage`),
  CONSTRAINT `fk_Package_has_Parcel_Package1` FOREIGN KEY (`idPackage`) REFERENCES `Package` (`idpackage`),
  CONSTRAINT `fk_Package_has_Parcel_Parcel1` FOREIGN KEY (`idParcel`) REFERENCES `Parcel` (`idparcel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Parcel_in_Package`
--

LOCK TABLES `Parcel_in_Package` WRITE;
/*!40000 ALTER TABLE `Parcel_in_Package` DISABLE KEYS */;
/*!40000 ALTER TABLE `Parcel_in_Package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Parcel_is_delivering`
--

DROP TABLE IF EXISTS `Parcel_is_delivering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Parcel_is_delivering` (
  `idParcel` int(10) unsigned NOT NULL,
  `idCar` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idParcel`,`idCar`),
  KEY `fk_Parcel_has_Cars_Cars1_idx` (`idCar`),
  KEY `fk_Parcel_has_Cars_Parcel1_idx` (`idParcel`),
  CONSTRAINT `fk_Parcel_has_Cars_Cars1` FOREIGN KEY (`idCar`) REFERENCES `Cars` (`idcar`),
  CONSTRAINT `fk_Parcel_has_Cars_Parcel1` FOREIGN KEY (`idParcel`) REFERENCES `Parcel` (`idparcel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Parcel_is_delivering`
--

LOCK TABLES `Parcel_is_delivering` WRITE;
/*!40000 ALTER TABLE `Parcel_is_delivering` DISABLE KEYS */;
/*!40000 ALTER TABLE `Parcel_is_delivering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PickUpType`
--

DROP TABLE IF EXISTS `PickUpType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `PickUpType` (
  `idPickUpType` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Type` varchar(45) NOT NULL DEFAULT 'Ordinary',
  PRIMARY KEY (`idPickUpType`),
  UNIQUE KEY `idOrderStatuses_UNIQUE` (`idPickUpType`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PickUpType`
--

LOCK TABLES `PickUpType` WRITE;
/*!40000 ALTER TABLE `PickUpType` DISABLE KEYS */;
INSERT INTO `PickUpType` VALUES (1,'HomeToHome'),(2,'WareToWare'),(3,'WareToHome'),(4,'HomeToWare');
/*!40000 ALTER TABLE `PickUpType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Trucks`
--

DROP TABLE IF EXISTS `Trucks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Trucks` (
  `idTruck` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idVehicles` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idTruck`),
  UNIQUE KEY `idTruck_UNIQUE` (`idTruck`),
  KEY `fk_Trucks_Vehicles1_idx` (`idVehicles`),
  CONSTRAINT `fk_Trucks_Vehicles1` FOREIGN KEY (`idVehicles`) REFERENCES `Vehicles` (`idvehicles`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Trucks`
--

LOCK TABLES `Trucks` WRITE;
/*!40000 ALTER TABLE `Trucks` DISABLE KEYS */;
INSERT INTO `Trucks` VALUES (1,2),(2,3);
/*!40000 ALTER TABLE `Trucks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VehicleStatus`
--

DROP TABLE IF EXISTS `VehicleStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `VehicleStatus` (
  `idVehicleStatus` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Status` varchar(45) NOT NULL,
  PRIMARY KEY (`idVehicleStatus`),
  UNIQUE KEY `idVehicleStatus_UNIQUE` (`idVehicleStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VehicleStatus`
--

LOCK TABLES `VehicleStatus` WRITE;
/*!40000 ALTER TABLE `VehicleStatus` DISABLE KEYS */;
INSERT INTO `VehicleStatus` VALUES (1,'Working'),(2,'OnMaintain'),(3,'NoDriver');
/*!40000 ALTER TABLE `VehicleStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vehicle_has_Driver`
--

DROP TABLE IF EXISTS `Vehicle_has_Driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Vehicle_has_Driver` (
  `idEmployees` int(10) unsigned NOT NULL,
  `idVehicles` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idEmployees`,`idVehicles`),
  KEY `fk_Employees_has_Vehicles_Vehicles1_idx` (`idVehicles`),
  KEY `fk_Employees_has_Vehicles_Employees1_idx` (`idEmployees`),
  CONSTRAINT `fk_Employees_has_Vehicles_Employees1` FOREIGN KEY (`idEmployees`) REFERENCES `Employees` (`idemployees`),
  CONSTRAINT `fk_Employees_has_Vehicles_Vehicles1` FOREIGN KEY (`idVehicles`) REFERENCES `Vehicles` (`idvehicles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vehicle_has_Driver`
--

LOCK TABLES `Vehicle_has_Driver` WRITE;
/*!40000 ALTER TABLE `Vehicle_has_Driver` DISABLE KEYS */;
/*!40000 ALTER TABLE `Vehicle_has_Driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vehicles`
--

DROP TABLE IF EXISTS `Vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Vehicles` (
  `idVehicles` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idVehicleStatus` int(10) unsigned NOT NULL,
  `idLocation` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idVehicles`),
  UNIQUE KEY `idVehicles_UNIQUE` (`idVehicles`),
  KEY `fk_Vehicles_VehicleStatus1_idx` (`idVehicleStatus`),
  KEY `fk_Vehicles_Location1_idx` (`idLocation`),
  CONSTRAINT `fk_Vehicles_Location1` FOREIGN KEY (`idLocation`) REFERENCES `Location` (`idlocation`),
  CONSTRAINT `fk_Vehicles_VehicleStatus1` FOREIGN KEY (`idVehicleStatus`) REFERENCES `VehicleStatus` (`idvehiclestatus`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vehicles`
--

LOCK TABLES `Vehicles` WRITE;
/*!40000 ALTER TABLE `Vehicles` DISABLE KEYS */;
INSERT INTO `Vehicles` VALUES (2,3,2),(3,3,3);
/*!40000 ALTER TABLE `Vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WareHouse`
--

DROP TABLE IF EXISTS `WareHouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `WareHouse` (
  `idWareHouse` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Capacity` int(10) unsigned NOT NULL,
  `CurrentLoad` int(10) unsigned NOT NULL,
  `idAddress` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idWareHouse`),
  UNIQUE KEY `idWareHouse_UNIQUE` (`idWareHouse`),
  KEY `fk_WareHouse_Address1_idx` (`idAddress`),
  CONSTRAINT `fk_WareHouse_Address1` FOREIGN KEY (`idAddress`) REFERENCES `Address` (`idaddress`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WareHouse`
--

LOCK TABLES `WareHouse` WRITE;
/*!40000 ALTER TABLE `WareHouse` DISABLE KEYS */;
INSERT INTO `WareHouse` VALUES (1,1000,0,5),(2,10000,0,9),(6,1000,0,13);
/*!40000 ALTER TABLE `WareHouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'LogisticCompany'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddAddress` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AddAddress`(
				country varchar(70), 
                region varchar(70), 
                city varchar(70), 
                street varchar(70), 
                buildingNum varchar(70), 
                additionInfo varchar(1000),
                out inserted_id int)
BEGIN
	
	insert into Address(Country, Region,City,Street,BuildingNum,AdditionInfo) 
    values (country,region,city,street,buildingNum,additionInfo);
    
	SELECT LAST_INSERT_ID()into inserted_id;
END ;;
DELIMITER ;
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
