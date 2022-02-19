---
external help file: PsCosmos.dll-Help.xml
Module Name: PsCosmos
online version:
schema: 2.0.0
---

# Disconnect-CSqlInstance

## SYNOPSIS

Disposes a CosmosDb connection.

## SYNTAX

```
Disconnect-CSqlInstance [-Client <CosmosClient>] [<CommonParameters>]
```

## DESCRIPTION
Disposes a CosmosDb connection and removes it as default from other commands.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Microsoft.Azure.Cosmos.CosmosClient

## OUTPUTS

## NOTES

## RELATED LINKS
