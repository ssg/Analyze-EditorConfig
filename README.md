```powershell
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
```
