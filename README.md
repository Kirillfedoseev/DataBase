# DataBase
## ERR-diagram of DB
![alt text](ERR-diagram.png)
# API to MySql Server
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
