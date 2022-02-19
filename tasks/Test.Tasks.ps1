task Emulator.Install -Jobs {
    winget install -e --id Microsoft.AzureCosmosEmulator
}

task Emulator.Import -Jobs Emulator.Install, {
    Import-Module "$env:ProgramFiles\Azure Cosmos DB Emulator\PSModules\Microsoft.Azure.CosmosDB.Emulator"
}

task Emulator.Start -Jobs Emulator.Import, {
    
    Start-CosmosDbEmulator
}