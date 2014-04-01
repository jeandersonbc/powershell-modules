<#
.SYNOPSIS
    PowerShell profile settings

.NOTES
    Author: Jeanderson Candido
    Date:   2013-MAR-30
#>

# ALIASES
# Put your alias here. For instance "set-alias alias Real_Name"
set-alias vi gvim
set-alias vim gvim

# PATH
$path_elements = @(
	"C:\Users\Jeanderson\Dev\apache-ant-1.9.1\bin";
	"C:\Users\Jeanderson\Dev\GnuWin32\bin";
	"C:\Program Files\SlikSvn\bin\";
	"C:\Users\Jeanderson\Dev\jflex-1.5.0\bin";
    "C:\Users\Jeanderson\Dev\winmd5free\";
)

# .DESCRIPTION
#     If exists, adds the given path to the system-path environment ($env:Path)
#     in this session. To make it persistant, hard code the path to the
#     $path_elements list.
#
function addPath($pathElement) {
    if (test-path $pathElement) {
        $env:PATH = $env:PATH + $pathElement + ";"
    }
}

foreach ($element in $path_elements) {
    addPath($element)
}

# .DESCRIPTION
#     Changes the prompt line to ``hh:mm computerName:[../relativePath]>``
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

# .DESCRIPTION
#     Creates a new file named by an argument
# .SYNTAX
#     newfile fileName1 [fileName2 fileName3 ... fileNameN]
# .EXAMPLE
#     newfile Makefile script.py header.h implementation.cpp
#
function newfiles {
    foreach($filename in $args) {
        new-item -Path . -itemtype "file" -name $filename
    }
}

# .DESCRIPTION
#     Starts a new process as an administrator
# .SYNTAX
#     sudo program
# .EXAMPLE
#     sudo powershell
#
function sudo($program) {
	start-process $program -verb runas
}
