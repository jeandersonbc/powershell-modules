<#
.SYNOPSIS
    PowerShell profile settings

.NOTES
    Author: Jeanderson Candido
    Date:   2013-MAR-30
#>

# ALIASES
set-alias vi gvim
set-alias vim gvim

# PATH
$env:PATH = $env:PATH + ";C:\Program Files\SlikSvn\bin\"

# .DESCRIPTION
#     Changes the prompt line to ``hh:mm computerName:[../relativePath]>``
function prompt {
    $rel_path = Resolve-Path . -Relative
    $color1 = [ConsoleColor]::DarkCyan
    $color2 = [ConsoleColor]::Cyan

    Write-Host $(get-date).toString("hh:mm ") -foregroundColor $color1 -noNewLine
    Write-Host ($env:ComputerName + ":[") -foregroundColor $color1 -noNewLine
    Write-Host $rel_path -foregroundColor $color2 -noNewLine
    Write-Host "]>" -foregroundColor $color1 -noNewLine

    return " "
}

# .DESCRIPTION
#     Creates a new file named by an argument
# .SYNTAX
#     newfile fileName1 [fileName2 fileName3 ... fileNameN]
# .EXAMPLE
#     newfile Makefile script.py header.h implementation.cpp
function newfile {
    foreach($filename in $args) {
        new-item -Path . -itemtype "file" -name $filename
    }
}
