DROP EXTERNAL DATA SOURCE zzshakaAzureDataLakeStore

CREATE EXTERNAL DATA SOURCE zzshakaAzureDataLakeStore
WITH
  ( LOCATION = N'abfss://primarycontainer@piawareadlssynapse.dfs.core.windows.net/' ,
    TYPE = HADOOP
  ) ;

DROP   EXTERNAL FILE FORMAT [HiveFileFormat_01] 

CREATE EXTERNAL FILE FORMAT [HiveFileFormat_01] 
WITH (
FORMAT_TYPE = DELIMITEDTEXT,
FORMAT_OPTIONS 
   (
	FIELD_TERMINATOR = '0x01', 
	FIRST_ROW=1,
	USE_TYPE_DEFAULT = False)
	)


CREATE EXTERNAL TABLE [dbo].[zzextDimProductSubcategory]
(
	[ProductSubcategoryKey] [int] ,
	[ProductSubcategoryAlternateKey] [int] ,
	[EnglishProductSubcategoryName] [nvarchar](50) ,
	[SpanishProductSubcategoryName] [nvarchar](50) ,
	[FrenchProductSubcategoryName] [nvarchar](50) ,
	[ProductCategoryKey] [int] 
)
WITH (DATA_SOURCE = zzshakaAzureDataLakeStore,LOCATION = N'/bcp/DimProductSubcategory.txt',FILE_FORMAT = [HiveFileFormat_01],REJECT_TYPE = VALUE,REJECT_VALUE = 0)
GO

SELECT * FROM [zzextDimProductSubcategory]
