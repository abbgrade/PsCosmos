requires Configuration

[System.IO.FileInfo] $global:Manifest = "$PSScriptRoot/../src/PsCosmos/bin/$Configuration/net5.0/publish/PsCosmos.psd1"


# Synopsis: Build project.
task Build {
	exec { dotnet publish ./src/PsCosmos -c $Configuration }
}

# Synopsis: Remove files.
task Clean {
	remove src/PsCosmos/bin, src/PsCosmos/obj
}

task Import -Jobs Build, {
	Import-Module $global:Manifest
}

task Docs -Jobs Import, {

	if ( Test-Path ./docs -PathType Container ) {
		Update-MarkdownHelp ./docs
	} else {
		New-MarkdownHelp -Module PsCosmos -OutputFolder ./docs
	}
}

# Synopsis: Install the module.
task Install -Jobs Build, {
    $info = Import-PowerShellDataFile $global:Manifest.FullName
    $version = ([System.Version] $info.ModuleVersion)
    $name = $global:Manifest.BaseName
    $defaultModulePath = $env:PsModulePath -split ';' | Select-Object -First 1
    $installPath = Join-Path $defaultModulePath $name $version.ToString()
    New-Item -Type Directory $installPath -Force | Out-Null
    Get-ChildItem $global:Manifest.Directory | Copy-Item -Destination $installPath -Recurse -Force
}

# Synopsis: Publish the module to PSGallery.
task Publish -Jobs Install, {

	assert ( $Configuration -eq 'Release' )

	Publish-Module -Name PsCosmos -NuGetApiKey $NuGetApiKey
}