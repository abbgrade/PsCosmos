---
external help file: PsCosmos.dll-Help.xml
Module Name: PsCosmos
online version:
schema: 2.0.0
---

# Invoke-CSqlQuery

## SYNOPSIS
Queries a CosmosDb using SQL.

## SYNTAX

```
Invoke-CSqlQuery [-Text] <String> [-Client <CosmosClient>] -Database <String> -Container <String>
 [-Timeout <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Executes a Cosmos SQL query and returns the result as PowerShell objects.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -Client
Specifies the connection to Cosmos Db. If not specified, the last connected instance is used.

```yaml
Type: CosmosClient
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Container
Specifies the container to execute the query in.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Database
Specifies the database to execute the query in.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Text
Specifies the SQL query text.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Timeout
Specifies a timeout for the query in seconds. If not specified, no timeout is used.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

### Microsoft.Azure.Cosmos.CosmosClient

### System.Int32

## OUTPUTS

### System.Management.Automation.PSObject

## NOTES

## RELATED LINKS
