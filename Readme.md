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

### Release

1. Create release branch using gitflow.
2. Update version number in psd1 file.
3. Update changelog in this readme file.
4. Uninstall old versions.
5. publish release using `Invoke-Build Publish -Configuration Release`.
6. finish release using gitflow.
