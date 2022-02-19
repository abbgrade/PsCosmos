@{
    RootModule           = 'PsCosmos.dll'
    ModuleVersion        = '0.1.0'
    GUID                 = 'a62467b8-2412-40d4-ae42-c9c616bf20ec'
    Author               = 'Steffen Kampmann'
    Copyright            = '(c) 2022 Steffen Kampmann. Alle Rechte vorbehalten.'
    Description          = 'The PowerShell Cosmos module provides access to Cosmos SQL.'
    PowerShellVersion    = '7.0'
    FunctionsToExport    = @()
    CmdletsToExport      = @('Connect-Instance', 'Disconnect-Instance', 'Invoke-Query')
    VariablesToExport    = '*'
    AliasesToExport      = @()
    PrivateData          = @{
        PSData = @{
            Tags       = @('sql', 'cosmosdb')
            LicenseUri = 'https://github.com/abbgrade/PsCosmos/blob/main/LICENSE'
            ProjectUri = 'https://github.com/abbgrade/PsCosmos'
            Prerelease = 'alpha'

        }
    }
    DefaultCommandPrefix = 'CSql'
}
