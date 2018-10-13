CREATE DEFINER=`root`@`%` PROCEDURE `GetAccessRights`(login varchar(30), passHash varchar(25) , out access varchar(45))
BEGIN
    
    declare a int default '-1';
    
	Select e.AccessRights_idAccessRights
	from Employees  as e 
	where e.Login = login and e.PassHash = passHash
	into a;
    
    select access_role from AccessRights as r 
    where a =  r.idAccessRights
    into access;

END