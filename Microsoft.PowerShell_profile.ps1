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
set-alias npp "C:\Program Files (x86)\Notepad++\notepad++.exe"

# PATH
$path_elements = @(
	"$HOME\Dev\apache-ant-1.9.1\bin";
	"$HOME\Dev\GnuWin32\bin";
	"$HOME\Dev\jflex-1.5.0\bin";
	"$HOME\Dev\winmd5free\";
    "$HOME\Dev\apache-maven-3.2.3\bin";
    "$HOME\Dev\apache-maven-3.2.3\bin";
    "C:\Program Files (x86)\Git\cmd";
    "C:\HashiCorp\Vagrant\bin";
)

# .DESCRIPTION
#     If exists, adds the given path to the system-path environment
#     ($env:Path) in this session. To make it persistant, hard code
#     the path to the $path_elements list.
#
function addPath($pathElement) {
    if (test-path $pathElement) {
        $env:PATH = $env:PATH + ";" + $pathElement
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
#     admin program
# .EXAMPLE
#     admin powershell
#
function admin($program) {
	start-process $program -verb runas
}

# Honestly, life is too short to update every single git project manually...
function gitupdate($projectDirRegex) {
    foreach ($dir in dir) {
        if ($dir.Name.contains($projectDirRegex) -and $dir.Attributes.ToString().Equals("Directory")) {
            cd $dir;
            Write-Host "Pulling changes for '$dir'..." -ForegroundColor Green
            git pull;
            cd ..;
        }
    }
    Write-Host "Done!" -ForegroundColor Green
}
