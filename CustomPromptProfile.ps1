<#
.SYNOPSIS
		PowerShell PROMPT Override

.NOTES
		Author: Jeanderson Candido
		Date:	 2013-MAR-30
#>

# .DESCRIPTION
#		Overrides the prompt line to ``hh:mm computerName:[../relativePath]>``
#
function prompt {
		$rel_path = Resolve-Path . -Relative

		# Set your custom colors here
		$prompt_color = [ConsoleColor]::DarkCyan
		$path_color = [ConsoleColor]::Cyan

		Write-Host $(get-date).toString("hh:mm ") -foregroundColor $prompt_color -noNewLine
		Write-Host ($env:ComputerName + ":[") -foregroundColor $prompt_color -noNewLine
		Write-Host $rel_path -foregroundColor $path_color -noNewLine
		Write-Host "]>" -foregroundColor $prompt_color -noNewLine

		return " "
}
