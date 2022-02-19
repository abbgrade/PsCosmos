requires Configuration
requires ModuleName

[System.IO.DirectoryInfo] $PublishDirectory = "$PSScriptRoot/../publish"
[System.IO.DirectoryInfo] $SourceDirectory = "$PSScriptRoot/../src"
[System.IO.DirectoryInfo] $DocumentationDirectory = "$PSScriptRoot/../docs"
[System.IO.DirectoryInfo] $ModulePublishDirectory = "$PublishDirectory/$ModuleName"
[System.IO.DirectoryInfo] $ModuleSourceDirectory = "$SourceDirectory/$ModuleName"
[System.IO.DirectoryInfo] $BinaryDirectory = "$ModuleSourceDirectory/bin"
[System.IO.DirectoryInfo] $ObjectDirectory = "$ModuleSourceDirectory/obj"


# Synopsis: Build project.
task Build -Jobs {
	exec { dotnet publish $PSScriptRoot/../src/$ModuleName -c $Configuration -o $ModulePublishDirectory }
	$Global:Manifest = Get-Item $ModulePublishDirectory/$ModuleName.psd1
}, UpdateVersion

task UpdateVersion -If $BuildNumber {
	Update-ModuleManifest -Path $Global:Manifest -Prerelease "alpha$BuildNumber"
	# ( Get-Content -Path $Global:Manifest ) -replace '''alpha''', "'alpha.$BuildNumber'" | Set-Content -Path $Global:Manifest 
}

# Synopsis: Remove files.
task Clean {
	remove $BinaryDirectory, $ObjectDirectory, $PublishDirectory
}

task Import -Jobs Build, {
	Import-Module $Global:Manifest
}

task Docs -Jobs Import, {
	if ( Test-Path $DocumentationDirectory -PathType Container ) {
		Update-MarkdownHelp $DocumentationDirectory
	} else {
		New-MarkdownHelp -Module $ModuleName -OutputFolder $DocumentationDirectory
	}
}

# Synopsis: Install the module.
task Install -Jobs Build, {
    $info = Import-PowerShellDataFile $Global:Manifest
    $version = ([System.Version] $info.ModuleVersion)
    $name = $Global:Manifest.BaseName
    $defaultModulePath = $env:PsModulePath -split ';' | Select-Object -First 1
    $installPath = Join-Path $defaultModulePath $name $version.ToString()
    New-Item -Type Directory $installPath -Force | Out-Null
    Get-ChildItem $Global:Manifest.Directory | Copy-Item -Destination $installPath -Recurse -Force
}

# Synopsis: Publish the module to PSGallery.
task Publish -Jobs Build, {
	assert ( $Configuration -eq 'Release' )
	Publish-Module -Path $Global:Manifest.Directory -NuGetApiKey $NuGetApiKey -Force:$ForcePublish
}