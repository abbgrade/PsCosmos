Describe PsCosmos {
    It 'is valid' {
        Test-ModuleManifest $PSScriptRoot\..\publish\PsCosmos\PsCosmos.psd1
    }

    It 'can be imported' {
        Import-Module $PSScriptRoot\..\publish\PsCosmos\PsCosmos.psd1
    }

    Context 'loaded modules' {
        BeforeAll {
            Import-Module $PSScriptRoot\..\publish\PsCosmos\PsCosmos.psd1 -Verbose
        }

        It 'has commands' {
            $commands = Get-Command -Module PsCosmos
            $commands | Should -Not -BeNullOrEmpty
        }
    }
}
