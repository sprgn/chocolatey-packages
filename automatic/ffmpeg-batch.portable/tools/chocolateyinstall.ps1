﻿$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\FFmpeg_Batch_2.1.4_Portable.exe"
  file64      = "$toolsDir\FFmpeg_Batch_2.1.4_Portable_x64.exe"
}


# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
if (Get-OSArchitectureWidth -Compare "64") { $arch = "_x64" } else { $arch = "" }

$shortcutFilePath = Join-Path $programs "FFmpeg Batch Portable.lnk"
$targetPath = Join-Path $toolsDir "FFmpeg_Batch_2.1.4_Portable${arch}.exe"
Install-ChocolateyShortcut -RunAsAdmin -shortcutFilePath "$shortcutFilePath" -targetPath "$targetPath"
