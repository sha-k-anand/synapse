
CREATE TABLE dbo.Membership  
  (MemberID int IDENTITY ,  
   FirstName varchar(100) MASKED WITH (FUNCTION = 'partial(1,"XXXXXXX",0)') NULL,  
   LastName varchar(100) NOT NULL,  
   Phone varchar(12) MASKED WITH (FUNCTION = 'default()') NULL,  
   Email varchar(100) MASKED WITH (FUNCTION = 'email()') NULL);  
  
INSERT dbo.Membership (FirstName, LastName, Phone, Email) VALUES   ('Roberto', 'Tamburello', '555.123.4567', 'RTamburello@contoso.com')
INSERT dbo.Membership (FirstName, LastName, Phone, Email) VALUES   ('Janice', 'Galvin', '555.123.4568', 'JGalvin@contoso.com.co')  
INSERT dbo.Membership (FirstName, LastName, Phone, Email) VALUES   ('Zheng', 'Mu', '555.123.4569', 'ZMu@contoso.net')  


SELECT * FROM dbo.Membership;  

-- In Master
CREATE LOGIN dbuser001 WITH password='securitytest@2021';
CREATE USER  dbuser001 FROM LOGIN dbuser001

-- User DB
CREATE USER  dbuser001 FROM LOGIN dbuser001
GRANT SELECT on SCHEMA::dbo to dbuser001

SELECT SUBSTRING(email,2,1),* FROM dbo.Membership;  
SELECT CASE WHEN (SUBSTRING(email,2,1)) = 'G' THEN 1 ELSE 0 END as HasG,* FROM dbo.Membership;  


------
create schema cs
DROP TABLE cs.Membership_CS  
CREATE TABLE cs.Membership_CS  
  (MemberID int IDENTITY ,  
   FirstName varchar(100) ,  
   LastName varchar(100) NOT NULL,  
   Phone varchar(12) ,  
   Email varchar(100) );  
  
INSERT cs.Membership_CS (FirstName, LastName, Phone, Email) VALUES   ('Roberto', 'Tamburello', '555.123.4567', 'RTamburello@contoso.com')
INSERT cs.Membership_CS (FirstName, LastName, Phone, Email) VALUES   ('Janice', 'Galvin', '555.123.4568', 'JGalvin@contoso.com.co')  
INSERT cs.Membership_CS (FirstName, LastName, Phone, Email) VALUES   ('Zheng', 'Mu', '555.123.4569', 'ZMu@contoso.net')  




select * from cs.Membership_CS

GRANT SELECT ON cs.Membership_CS(MemberID, FirstName, LastName) TO dbuser001;



SELECT * FROM dbo.Membership 
SELECT SUBSTRING(email,2,1),* FROM dbo.Membership;  

SELECT CASE WHEN (SUBSTRING(email,2,1)) = 'G' THEN 1 ELSE 0 END as HasG,* FROM dbo.Membership;  

SELECT * FROM cs.Membership_CS;  
SELECT MemberID, FirstName, LastName FROM cs.Membership_CS;  

--https://docs.microsoft.com/en-us/sql/relational-databases/security/encryption/encrypt-a-column-of-data?view=sql-server-ver15

