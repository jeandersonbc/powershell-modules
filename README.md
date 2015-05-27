# powershell-modules

Powershell utility modules.

## Importing modules

* If you do not have a profile module, create one at `$PROFILE`

After cloning this project, include modules by just importing then in your profile module. Consider the following example:

```{powershell}
Import-Module "path/to/powershell-modules/src/CustomPromptProfile.ps1"
```

## Troubeshooting

#### Failing to Import
In case your import fails, it is probably due to your current active execution policy.
Solve the issue with the following commands:
```{powershell}
Set-ExecutionPolicy -Scope CurrentUser Unrestricted
Import-Module $PROFILE # Reloads your profile in your current session
```
Read more about Execution Policy at https://technet.microsoft.com/library/hh847748.aspx
