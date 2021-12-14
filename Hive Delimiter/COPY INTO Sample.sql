CREATE TABLE [dbo].[zzDimProductSubcategory]
(
	[ProductSubcategoryKey] [int] NULL,
	[ProductSubcategoryAlternateKey] [int] NULL,
	[EnglishProductSubcategoryName] [nvarchar](50) NULL,
	[SpanishProductSubcategoryName] [nvarchar](50) NULL,
	[FrenchProductSubcategoryName] [nvarchar](50) NULL,
	[ProductCategoryKey] [int] NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)

COPY INTO [dbo].[zzDimProductSubcategory]
FROM 'https://piawareadlssynapse.dfs.core.windows.net/primarycontainer/bcp/DimProductSubcategory.txt'
WITH (
    FILE_TYPE = 'CSV',
    CREDENTIAL=(IDENTITY= 'Storage Account Key', SECRET=''),
    FIELDTERMINATOR='0x01',
	FIELDQUOTE='',
    ROWTERMINATOR='\n',
    ENCODING = 'UTF8',
    DATEFORMAT = 'ymd',
	MAXERRORS = 0,
	FIRSTROW = 1
)



CREATE TABLE [dbo].SampleHandleQuotes
(
	[Col1] ,
	[Col2] ,
	[Col3] ,
	[Col4] 
) 

COPY INTO [dbo].SampleHandleQuotes (Col1,Col2,Col3,Col4)
FROM 'https://piawareadlssynapse.dfs.core.windows.net/primarycontainer/bcp/SampleHandleQuotes.dat'
WITH (
    FILE_TYPE = 'CSV',
    --CREDENTIAL=(IDENTITY= 'Storage Account Key', SECRET=''),
	--CREDENTIAL=(IDENTITY= 'Managed Identity'),
    FIELDTERMINATOR='0x01',
	FIELDQUOTE='',
    ROWTERMINATOR='\n',
    ENCODING = 'UTF8',
    DATEFORMAT = 'ymd',
	MAXERRORS = 0,
	FIRSTROW = 1
)
