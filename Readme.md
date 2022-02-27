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

- Added commands to connect, disconnect and query Cosmos DB.

### 0.2.0

- Added help / documentation to the commands.

## Development

- This is a [Portable Module](https://docs.microsoft.com/de-de/powershell/scripting/dev-cross-plat/writing-portable-modules?view=powershell-7) based on [PowerShell Standard](https://github.com/powershell/powershellstandard) and [.NET Standard](https://docs.microsoft.com/en-us/dotnet/standard/net-standard).
- [VSCode](https://code.visualstudio.com) is recommended as IDE. [VSCode Tasks](https://code.visualstudio.com/docs/editor/tasks) are configured.
- Build automation is based on [InvokeBuild](https://github.com/nightroman/Invoke-Build)
- Test automation is based on [Pester](https://pester.dev)
- Documentation is based on [platyPs](https://github.com/PowerShell/platyPS)
- Commands are named based on [Approved Verbs for PowerShell Commands](https://docs.microsoft.com/de-de/powershell/scripting/developer/cmdlet/approved-verbs-for-windows-powershell-commands)
- This project uses [git-flow](https://github.com/nvie/gitflow).
- This modules uses [Semantic Versioning 1.0.0](https://semver.org/spec/v1.0.0.html)

### Build

The build scripts require InvokeBuild. If it is not installed, install it with the command `Install-Module InvokeBuild -Scope CurrentUser`.

You can build the module using the VS Code build task or with the command `Invoke-Build Build`.

### Release

1. Create a release branch using git-flow.
2. Update the version number in the module manifest.
3. Extend the changelog in this readme.
4. If you want to create a pre-release.
   1. Push the release branch to github, to publish the pre-release to PsGallery.
5. Finish release using git-flow.
6. Check if tags are not pushed to github.
7. Check if the release branch is deleted on github.
8. Create the release on github.
