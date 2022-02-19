# PsCosmos

The PowerShell Cosmos module provides access to Cosmos SQL.

## Installation

This module can be installed from [PsGallery](https://www.powershellgallery.com/packages/PsCosmos).

```powershell
Install-Module -Name PsCosmos -Scope CurrentUser
```

Alternatively it can be build and installed from source.

1. Install the development dependencies
2. Download or clone it from GitHub
3. Run the installation task:

```powershell
Invoke-Build Install
```

## Changelog

### 0.1.0

- Added commands to connect, disconnect and query cosmos db.

## Development

- This is a [Portable Module](https://docs.microsoft.com/de-de/powershell/scripting/dev-cross-plat/writing-portable-modules?view=powershell-7) based on [PowerShell Standard](https://github.com/powershell/powershellstandard) and [.NET Standard](https://docs.microsoft.com/en-us/dotnet/standard/net-standard).
- [VSCode](https://code.visualstudio.com) is recommended as IDE. [VSCode Tasks](https://code.visualstudio.com/docs/editor/tasks) are configured.
- Build automation is based on [InvokeBuild](https://github.com/nightroman/Invoke-Build)
- Test automation is based on [Pester](https://pester.dev)
- Documentation is based on [platyPs](https://github.com/PowerShell/platyPS)
- Commands are named based on [Approved Verbs for PowerShell Commands](https://docs.microsoft.com/de-de/powershell/scripting/developer/cmdlet/approved-verbs-for-windows-powershell-commands)
- This project uses [gitflow](https://github.com/nvie/gitflow).
- This modules uses [Semantic Versioning 1.0.0](https://semver.org/spec/v1.0.0.html)

### Build

The build scripts require InvokeBuild. If it is not installed, install it with the command `Install-Module InvokeBuild -Scope CurrentUser`.

You can build the module using the VS Code build task or with the command `Invoke-Build Build`.

### Release

1. Create release branch using gitflow.
2. Update version number in psd1 file.
3. Update changelog in this readme file.
4. Uninstall old versions.
5. publish release using `Invoke-Build Publish -Configuration Release`.
6. finish release using gitflow.
