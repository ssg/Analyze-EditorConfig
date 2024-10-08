<#
.SYNOPSIS
Analyzes an .editorconfig file to find duplicate keys and displays them.

.DESCRIPTION
Reads an .editorconfig file, identifies lines with key-value pairs, 
groups them by key, and then displays any keys that have duplicates along with their values.

.PARAMETER File
Specifies the path to the .editorconfig file to be analyzed. Defaults to ".editorconfig".

.EXAMPLE
.\Analyze-EditorConfig.ps1 -File "path\to\.editorconfig"
This command analyzes the specified .editorconfig file for duplicate keys.

.NOTES
Author: Sedat Kapanoglu
Date: 2024-10-08
#>

param (
  [System.IO.FileInfo]$File = ".editorconfig"
)

Get-Content $File
| Where-Object { $_ -like '*=*' } 
| ForEach-Object { @{ Key = ($_ -split "=")[0].Trim(); Value = $_; LineNumber = $_.ReadCount } } 
| Group-Object Key 
| Where-Object { $_.Count -gt 1 } 
| Sort-Object -Descending Count 
| ForEach-Object { 
  foreach ($line in $_.Group) {
    Write-Output "Line $($line.LineNumber): $($line.Value)"
   } 
   Write-Output "" 
 }
