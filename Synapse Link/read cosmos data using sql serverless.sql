CREATE CREDENTIAL [zzshakacosmosdb01]    WITH IDENTITY = 'SHARED ACCESS SIGNATURE', SECRET = ''

SELECT TOP 100 *
FROM OPENROWSET(​PROVIDER = 'CosmosDB',
                CONNECTION = 'Account=zzshakacosmosdb01;Database=db01',
                OBJECT = 'cont01',
                SERVER_CREDENTIAL = 'zzshakacosmosdb01'
) AS [cont01]




SELECT 
    _rid,
    _etag,
    _ts,
    id,
    JSON_VALUE(meta,'$.rowid')   as meta_data_version,
    JSON_VALUE(meta,'$.data_version')   as meta_data_version,
    JSON_VALUE(meta,'$.created')   as meta_created,
    JSON_VALUE(meta,'$.revision')   as meta_revision,


    JSON_VALUE(info ,'$.city')               as info_venue ,
	JSON_VALUE(info ,'$.dates[0]')            as info_dates1,
  
   	JSON_VALUE(info ,'$.overs')      as info_overs,
	JSON_VALUE(info ,'$.teams[0]')     as info_team01,
	JSON_VALUE(info ,'$.teams[1]')     as info_team02,
	JSON_VALUE(info ,'$.toss.decision')     as info_toss_decision,
    JSON_VALUE(info ,'$.toss.winner')     as info_toss_winner

FROM OPENROWSET('CosmosDB',
                'Account=cosmosoltp2;Database=cont01;Key=',
                cont100) AS cont100

SELECT 
    _rid,
    _etag,
    _ts,
    id,
    JSON_VALUE(meta,'$.rowid')   as meta_data_version,
    JSON_VALUE(meta,'$.data_version')   as meta_data_version,
    JSON_VALUE(meta,'$.created')   as meta_created,
    JSON_VALUE(meta,'$.revision')   as meta_revision,


    JSON_VALUE(info ,'$.city')               as info_venue ,
	JSON_VALUE(info ,'$.dates[0]')            as info_dates1,
  
   	JSON_VALUE(info ,'$.overs')      as info_overs,
	JSON_VALUE(info ,'$.teams[0]')     as info_team01,
	JSON_VALUE(info ,'$.teams[1]')     as info_team02,
	JSON_VALUE(info ,'$.toss.decision')     as info_toss_decision,
    JSON_VALUE(info ,'$.toss.winner')     as info_toss_winner
FROM OPENROWSET(​PROVIDER = 'CosmosDB',
                CONNECTION = 'Account=zzshakacosmosdb01;Database=db01',
                OBJECT = 'cont01',
                SERVER_CREDENTIAL = 'zzshakacosmosdb01'
) AS [cont01]
