CREATE EXTERNAL DATA SOURCE [ext_datasource1]  WITH (TYPE = HADOOP, LOCATION = N'abfss://container01@shakasynapseadlsgen2.dfs.core.windows.net')
GO
CREATE EXTERNAL FILE FORMAT [TextFileFormat_HiveCtrlA1] WITH (FORMAT_TYPE = DELIMITEDTEXT, FORMAT_OPTIONS (FIELD_TERMINATOR = N'0x01', DATE_FORMAT = N'yyyy-MM-dd HH:mm:ss', FIRST_ROW = 2, USE_TYPE_DEFAULT = False))
GO
CREATE EXTERNAL TABLE [dbo].[external_DimProductSubcategory2]
(
	[ProductSubcategoryKey] [int],
	[ProductSubcategoryAlternateKey] [int] ,
	[EnglishProductSubcategoryName] [nvarchar](50) ,
	[SpanishProductSubcategoryName] [nvarchar](50) ,
	[FrenchProductSubcategoryName] [nvarchar](50) ,
	[ProductCategoryKey] [int] 
)
WITH (DATA_SOURCE = [ext_datasource1],LOCATION = N'/folder01/DimProductSubcategory/DimProductSubcategory.txt',FILE_FORMAT = [TextFileFormat_HiveCtrlA1],REJECT_TYPE = VALUE,REJECT_VALUE = 0)
GO
SELECT * FROM [external_DimProductSubcategory2]
SELECT * FROM [external_DimProductSubcategory1]


--Double quoted
CREATE EXTERNAL FILE FORMAT [TextFileFormat_001] WITH (FORMAT_TYPE = DELIMITEDTEXT, FORMAT_OPTIONS (FIELD_TERMINATOR = N',',STRING_DELIMITER='0x22', FIRST_ROW = 2,USE_TYPE_DEFAULT=TRUE))


-------------------------------------

CREATE DATABASE SCOPED CREDENTIAL msi_cred  WITH IDENTITY = 'Managed Service Identity'
CREATE EXTERNAL DATA SOURCE [ext_datasource1]  WITH (TYPE = HADOOP, LOCATION = N'abfss://cont01@zzsynapsembnettest005.dfs.core.windows.net',CREDENTIAL = msi_cred)
CREATE EXTERNAL FILE FORMAT [TextFileFormat_HiveCtrlA1] WITH (FORMAT_TYPE = DELIMITEDTEXT, FORMAT_OPTIONS (FIELD_TERMINATOR = N'0x01', DATE_FORMAT = N'yyyy-MM-dd HH:mm:ss', FIRST_ROW = 2, USE_TYPE_DEFAULT = False))

CREATE EXTERNAL TABLE [dbo].[external_DimProductSubcategory2]
(
	[ProductSubcategoryKey] [int],
	[ProductSubcategoryAlternateKey] [int] ,
	[EnglishProductSubcategoryName] [nvarchar](50) ,
	[SpanishProductSubcategoryName] [nvarchar](50) ,
	[FrenchProductSubcategoryName] [nvarchar](50) ,
	[ProductCategoryKey] [int] 
)
WITH (DATA_SOURCE = [ext_datasource1],LOCATION = N'/DimProductSubcategory.txt',FILE_FORMAT = [TextFileFormat_HiveCtrlA1],REJECT_TYPE = VALUE,REJECT_VALUE = 0)

SELECT * FROM [dbo].[external_DimProductSubcategory2]

--
DROP EXTERNAL TABLE [dbo].[external_DimProductSubcategory2]
GO
DROP EXTERNAL FILE FORMAT [TextFileFormat_HiveCtrlA1]
GO
DROP EXTERNAL DATA SOURCE [ext_datasource1] 
GO
DROP DATABASE SCOPED CREDENTIAL msi_cred 


select * from sys.credentials
