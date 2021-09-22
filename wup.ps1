set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope LocalMachine  -force 2>&1

$host.UI.RawUI.ForegroundColor = "Green"

Get-Date -DisplayHint Date 


Write-Host "Install Windows Updates"                
""    

Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force


Install-Module pswindowsupdate -force

Set-Location -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce'

Set-ItemProperty -Path . -Name update -Value 'C:\WINDOWS\system32\WindowsPowerShell\v1.0\powershell.exe "C:\windows\logs\wup1.ps1"'

Install-WindowsUpdate -ForceDownload -ForceInstall  -AcceptAll -AutoReboot
