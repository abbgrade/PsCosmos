#region InvokeBuild

task UpdateBuildTasks {
    Invoke-WebRequest `
        -Uri 'https://raw.githubusercontent.com/abbgrade/PsBuildTasks/main/DotNet/Build.Tasks.ps1' `
        -OutFile "$PSScriptRoot\Build.Tasks.ps1"
}

#endregion
#region GitHub Actions

task UpdateValidationWorkflow {
    Invoke-WebRequest `
        -Uri 'https://raw.githubusercontent.com/abbgrade/PsBuildTasks/main/GitHub/build-validation-matrix.yml' `
        -OutFile "$PSScriptRoot\..\.github\workflows\build-validation.yml"
}

task UpdatePreReleaseWorkflow {
    Invoke-WebRequest `
        -Uri 'https://raw.githubusercontent.com/abbgrade/PsBuildTasks/main/GitHub/pre-release-windows.yml' |
    ForEach-Object { $_ -replace 'MyModuleName', $ModuleName } |
    Out-File "$PSScriptRoot\..\.github\workflows\pre-release.yml" -NoNewline
}

task UpdateReleaseWorkflow {
    Invoke-WebRequest `
        -Uri 'https://raw.githubusercontent.com/abbgrade/PsBuildTasks/main/GitHub/release-windows.yml' |
    ForEach-Object { $_ -replace 'MyModuleName', $ModuleName } |
    Out-File "$PSScriptRoot\..\.github\workflows\release.yml" -NoNewline
}

#endregion
#region GitHub Pages

task UpdateIndexPage {
    Invoke-WebRequest `
        -Uri 'https://raw.githubusercontent.com/abbgrade/PsBuildTasks/main/docs/index.md' `
        -OutFile "$PSScriptRoot\..\docs\index.md"
    Invoke-WebRequest `
        -Uri 'https://raw.githubusercontent.com/abbgrade/PsBuildTasks/main/docs/_config.yml' `
        -OutFile "$PSScriptRoot\..\docs\_config.yml"
}

#endregion
#region GitHub Dependabot

task UpdateDependabotConfig {
    Invoke-WebRequest `
        -Uri 'https://raw.githubusercontent.com/abbgrade/PsBuildTasks/main/dependabot/dependabot.yml' |
    ForEach-Object { $_ -replace 'MyModuleName', $ModuleName } |
    Out-File "$PSScriptRoot\..\.github\dependabot.yml" -NoNewline
}

#endregion
#region VsCode

task UpdateVsCodeTasks {
    Invoke-WebRequest `
        -Uri 'https://raw.githubusercontent.com/abbgrade/PsBuildTasks/main/VsCode/tasks.json' `
        -OutFile "$PSScriptRoot\..\.vscode\tasks.json"
}

#endregion
#region PsBuildTasks

task UpdatePsBuildTasksTasks {
    Invoke-WebRequest `
        -Uri 'https://raw.githubusercontent.com/abbgrade/PsBuildTasks/main/tasks/Dotnet-Matrix.Tasks.ps1' `
        -OutFile "$PSScriptRoot\PsBuild.Tasks.ps1"
}

#endregion

task UpdatePsBuildTasks -Jobs UpdateBuildTasks, UpdateValidationWorkflow, UpdatePreReleaseWorkflow, UpdateReleaseWorkflow, UpdateIndexPage, UpdateDependabotConfig, UpdateVsCodeTasks, UpdatePsBuildTasksTasks
