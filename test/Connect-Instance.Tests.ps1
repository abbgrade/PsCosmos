Describe 'Connect-Instance' {
    
    BeforeDiscovery {
        $EmulatorModule = Import-Module "$env:ProgramFiles\Azure Cosmos DB Emulator\PSModules\Microsoft.Azure.CosmosDB.Emulator" -PassThru -ErrorAction Continue
    }
    
    BeforeAll {
        Import-Module $PSScriptRoot\..\publish\PsCosmos\PsCosmos.psd1 -PassThru -ErrorAction Stop
    }

    Context 'Emulator Installation' -Skip:( -Not $EmulatorModule ) {

        BeforeDiscovery {
            $Script:CosmosDbEmulatorStatus = Get-CosmosDbEmulatorStatus
        }

        Context 'Emulator' -Skip:($Script:CosmosDbEmulatorStatus -ne 'Running') {

            BeforeAll {
                $Script:Endpoint = 'https://localhost:8081'
                $Script:ReadKey = 'C2y6yDjf5/R+ob0N8A7Cgv30VRDJIWEHLM+4QDU5DE2nQ9nDuVTqobD4b8mGGyPMbIZnqyMsEcaGQy67XIw/Jw=='
            }

            It 'connects' {
                Connect-CSqlInstance -Endpoint $Script:Endpoint -ReadKey $Script:ReadKey
            }
        }

        Context 'Nonsense' -Skip:($Script:CosmosDbEmulatorStatus -ne 'Running') {

            BeforeAll {
                $Script:Endpoint = 'https://localhost:4711'
                $Script:ReadKey = 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=='
            }

            It 'connects' {
                {
                    Connect-CSqlInstance -Endpoint $Script:Endpoint -ReadKey $Script:ReadKey
                } | Should -Throw
            }
        }
    }
}