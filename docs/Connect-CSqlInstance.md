---
external help file: PsCosmos.dll-Help.xml
Module Name: PsCosmos
online version:
schema: 2.0.0
---

# Connect-CSqlInstance

## SYNOPSIS
Creates a connection to a CosmosDb instance.

## SYNTAX

```
Connect-CSqlInstance [-Endpoint] <String> [-ReadKey] <String> [<CommonParameters>]
```

## DESCRIPTION
Cosmos SQL queries require a authenticated client, which is created by this command using a CosmosDb instance endpoint and a ReadKey.
The latest created connection is used as default connection for other commands, that require a connection.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -Endpoint
Specifies the endpoint, that is required to identify the CosmosDb instance.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -ReadKey
Specifies the key, to authenticate the client.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

## OUTPUTS

### Microsoft.Azure.Cosmos.CosmosClient

## NOTES

## RELATED LINKS
