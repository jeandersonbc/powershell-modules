# powershell-modules

Powershell utility modules. Include modules by just importing then in your profile module:

```{powershell}
Import-Module "path/to/module/file.ps1"
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
