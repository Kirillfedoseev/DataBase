# DataBase
## ERR-diagram of DB
![alt text](ERR-diagram.png)
# API to MySql Server
## List of Stored procedures
* `AddAddress`
* `AddCar`
* `AddContact`
* `AddOrderLoggedIn`
* `AddOrderLoggedOut`
* `AddOrderWithAddress`
* `AddOrderWithContact`
* `AddOrderWithContactAndAddress`
* `AddTruck`
* `AddWarehouse`
* `AppendParcelToPackage`
* `BlockCustomer`
* `BlockEmployee`
* `CahangeOrderStatusById`
* `CahangeOrderStatusByName`
* `CreatePackage`
* `CreateParcel`
* `DisbandPackageAtWareHouse`
* `GetAccessRights`
* `GetOrders`
* `GetOrdersOfCustomer`
* `GetOrdersOnValidating`
* `GetParcel`
* `GetParcelsInPackage`
* `GetWareHouses`
* `RegisterCustomer`
* `RegisterEmployee`
* `SendPackageWithTruck`
## Function get orders (example)
Get all orders with all information about them<br/>
### Call

```python
  mysql.GetOrders():JSON
```

### JSON structure
``` json
{
  OrderID:Int,
  OrderInfo:String
}                          
```



