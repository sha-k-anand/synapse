SELECT TOP 100
		[result].filepath() as filepath1,    
        JSON_VALUE (jsonContent, '$.time') as time,
        JSON_VALUE (jsonContent, '$.category') as category,
        JSON_VALUE (jsonContent, '$.operationName') as operationName,
        JSON_VALUE (jsonContent, '$.category') as category,
        JSON_VALUE (jsonContent, '$.durationMs') as durationMs,
        JSON_VALUE (jsonContent, '$.identity.type') as identity1_type,
		JSON_VALUE (jsonContent, '$.properties.objectKey') as identity1_type1,
		JSON_VALUE (JSON_QUERY (jsonContent, '$.identity.requester') ,'$.upn')as identity1_type
FROM
    OPENROWSET(
        BULK 'https://cloudfilesblob.blob.core.windows.net/insights-logs-storageread/resourceId=/subscriptions/c8ae7563-2954-4307-b209-e472425469f4/resourceGroups/LendingClub/providers/Microsoft.Storage/storageAccounts/lendingclubadls/blobServices/*/*/*/*/*/*/*.json',
        FORMAT = 'CSV',
        FIELDQUOTE = '0x0b',
        FIELDTERMINATOR ='0x0b',
        ROWTERMINATOR = '\n'
    )
    WITH (
        jsonContent varchar(MAX)
    ) AS [result]

	WHERE 
	[result].filepath() = 'https://cloudfilesblob.blob.core.windows.net/insights-logs-storageread/resourceId=/subscriptions/c8ae7563-2954-4307-b209-e472425469f4/resourceGroups/LendingClub/providers/Microsoft.Storage/storageAccounts/lendingclubadls/blobServices/default/y=2021/m=09/d=23/h=17/m=00/PT1H.json'
