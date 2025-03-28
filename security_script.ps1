#Run Powershell ISE as an Administrator and run the following command
#set-executionpolicy bypass

If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
    Write-Host "You didn't run this script as an Administrator."
    Exit
}

##Create a System Restore Point
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" -Name "SystemRestorePointCreationFrequency" -Value 360

Checkpoint-Computer -Description "Restore Point-TBYPFWXI" -RestorePointType "MODIFY_SETTINGS"

cd ~\Downloads\TBYPFWXI-Windows11-DISA-STIG-V1R2

#Vulnerability ID - V-253452  !!!Reboot Required!!!
secedit /configure /db $Env:windir\security\local.sdb /cfg Windows11LocalSecurityPolicy.inf

##How to list apps
##Get-ProvisionedAppXPackage -Online|Select DisplayName
##Remove apps system wide
TASKKILL /f /im msteams.exe
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.MixedReality.Portal*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.BingNews*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.GetHelp*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.Getstarted*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.Messaging*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.Microsoft3DViewer*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.MicrosoftOfficeHub*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.MicrosoftSolitaireCollection*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.NetworkSpeedTest*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.News*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.RemoteDesktop*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.Office.Lens*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.Office.OneNote*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.Office.Sway*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.Office*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.Office.Todo.List*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.Todos*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.OneConnect*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.Print3D*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.SkypeApp*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.StorePurchaseApp*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.Whiteboard*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.WindowsAlarms*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.WindowsCamera*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*microsoft.windowscommunicationsapps*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.WindowsFeedbackHub*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.WindowsMaps*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.WindowsSoundRecorder*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.Xbox.TCUI*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.XboxApp*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.XboxGameOverlay*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.XboxIdentityProvider*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.XboxSpeechToTextOverlay*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.XboxGamingOverlay*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.ZuneMusic*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.ZuneVideo*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.MicrosoftStickyNotes*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.PowerAutomateDesktop*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.ScreenSketch*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.Windows.Photos*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.YourPhone*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*MicrosoftCorporationII.QuickAssist*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*MicrosoftWindows.Client.WebExperience*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Clipchamp*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.People*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.HEIFImageExtension*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.HEVCVideoExtension*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.RawImageExtension*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.VP9VideoExtensions*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.WebMediaExtensions*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.WebpImageExtension*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.WindowsTerminal*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Disney*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.GamingApp*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.549981C3F5F10*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*Microsoft.BingWeather*"} | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*MicrosoftTeams*"} | Remove-AppxProvisionedPackage -Online
        
##List all installed packages
#Get-AppxPackage | Select Name, PackageFullName,NonRemovable
#Get-AppxPackage -AllUsers | Select Name, PackageFullName,NonRemovable
## Removes metro apps for the current user
Get-AppxPackage -allusers *Microsoft.549981C3F5F10* | Remove-AppxPackage
Get-AppxPackage -allusers *OneDriveSync* | Remove-AppxPackage
Get-AppxPackage -allusers *SkypeApp* | Remove-AppxPackage
Get-AppxPackage -allusers *Xbox* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.Getstarted* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.BingWeather* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.BingNews* | Remove-AppxPackage
Get-AppxPackage -allusers *Spotify* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.GetHelp* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.Getstarted* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.MicrosoftStickyNotes* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.PowerAutomateDesktop* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.ScreenSketch* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.StorePurchaseApp* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.Todos* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.Windows.Photos* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.WindowsAlarms* | Remove-AppxPackage
Get-AppxPackage -allusers *microsoft.windowscommunicationsapps* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.WindowsFeedbackHub* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.WindowsSoundRecorder* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.YourPhone* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.ZuneMusic* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.ZuneVideo* | Remove-AppxPackage
Get-AppxPackage -allusers *MicrosoftCorporationII.QuickAssist* | Remove-AppxPackage
Get-AppxPackage -allusers *MicrosoftTeams* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.Teams* | Remove-AppxPackage
Get-AppxPackage -allusers *MicrosoftWindows.Client.WebExperience* | Remove-AppxPackage
Get-AppxPackage -allusers *Clipchamp* | Remove-AppxPackage
Get-AppxPackage -allusers *Disney* | Remove-AppxPackage
Get-AppxPackage -allusers *Camera* | Remove-AppxPackage
Get-AppxPackage -allusers *Maps* | Remove-AppxPackage
Get-AppxPackage -allusers *Office* | Remove-AppxPackage
Get-AppxPackage -allusers *People* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.HEIFImageExtension* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.HEVCVideoExtension* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.RawImageExtension* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.VP9VideoExtensions* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.WebMediaExtensions* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.WebpImageExtension* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.WindowsTerminal* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.GamingApp* | Remove-AppxPackage

###Clear pinned apps in taskbar
Remove-Item "C:\Users\$env:USERNAME\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\*" -Recurse -Force
Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" -Name "Favorites" -Force
Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" -Name "FavoritesChanges" -Force
Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" -Name "FavoritesResolve" -Force
Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" -Name "FavoritesVersion" -Force

#***Privacy Settings***
#Disable Cortana Search Function
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "AllowCortana" -Value 0

#Disable "Let apps show me personalized ads by using my advertising ID"
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" -Name "DisabledByGroupPolicy" -Value 1

#Disable "Let websites show me locally relevant content by accessing my language list"
Set-ItemProperty -Path "HKCU:\Control Panel\International\User Profile" -Name "HttpAcceptLanguageOptOut" -Value 1

#Disable "Let Windows improve Start and search results by tracking app launches"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_TrackProgs" -Value 0
New-Item -Path "HKCU:\Software\Policies\Microsoft\Windows\EdgeUI" -Force
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\EdgeUI" -Name "DisableMFUTracking" -Value 1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EdgeUI" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EdgeUI" -Name "DisableMFUTracking" -Value 1

#Disable "Show me suggested content in the Settings app"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338393Enabled" -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-353694Enabled" -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-353696Enabled" -Value 0

#Disabled "Get tips and suggestions when using Windows"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338389Enabled" -Value 0

#Disable "Online speech recognition"
New-Item -Path "HKCU:\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" -Name "HasAccepted" -Value 0

#Disable "Personal inking and typing dictionary"
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CPSS\Store\InkingAndTypingPersonalization" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CPSS\Store\InkingAndTypingPersonalization" -Name "Value" -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Personalization\Settings" -Name "AcceptedPrivacyPolicy" -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\InputPersonalization" -Name "RestrictImplicitInkCollection" -Value 1
Set-ItemProperty -Path "HKCU:\Software\Microsoft\InputPersonalization" -Name "RestrictImplicitTextCollection" -Value 1
Set-ItemProperty -Path "HKCU:\Software\Microsoft\InputPersonalization\TrainedDataStore" -Name "HarvestContacts" -Value 0

#Disable "Diagnostics & feedback"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" -Name "ShowedToastAtLevel" -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name "AllowTelemetry" -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name "MaxTelemetryAllowed" -Value 1

#Disable "Tailored experiences"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy" -Name "TailoredExperiencesWithDiagnosticDataEnabled" -Value 0

#Disable "Feedback frequency"
New-Item -Path "HKCU:\Software\Microsoft\Siuf\Rules" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Siuf\Rules" -Name "NumberOfSIUFInPeriod" -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Siuf\Rules" -Name "PeriodInNonoSeconds" -Value -

#Disable "Store my activity history on this device" Requires reboot to deactivate
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "PublishUserActivities" -Value 0

#Disable "Send my activity history to Microsoft"  Requires reboot to deactivate
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "UploadUserActivities" -Value 0

#Disable "SafeSearch" setting
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SearchSettings" -Name "SafeSearchMode" -Value 0

#Disable "Cloud content search - Microsoft accout"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SearchSettings" -Name "IsMSACloudSearchEnabled" -Value 0

#Disable "Cloud content search - Work or School account"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SearchSettings" -Name "IsAADCloudSearchEnabled" -Value 0

#Disable "History"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SearchSettings" -Name "IsDeviceSearchHistoryEnabled" -Value 0

#Disable "More settings - Show search highlights"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SearchSettings" -Name "IsDynamicSearchBoxEnabled" -Value 0

#Disable "Location Services"
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Name "Value" -Type String -Value "Deny" -Force

#Disable "Let apps access your location"
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CPSS\Store\UserLocationOverridePrivacySetting" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CPSS\Store\UserLocationOverridePrivacySetting" -Name "Value" -Value 0

#Disable "Camera access"
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" -Name "Value" -Type String -Value "Deny"

#Disable "Let apps access your camera"
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" -Name "Value" -Type String -Value "Deny"

#Disable "Microphone access"
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone" -Name "Value" -Type String -Value "Deny"

#Disable "Let apps access your microphone"
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone" -Name "Value" -Type String -Value "Deny"

#Disable "Notification access"
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener" -Name "Value" -Type String -Value "Deny"

#Disable "Let apps access your notifications"
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener" -Name "Value" -Type String -Value "Deny"

#Disable "Account info access"
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" -Name "Value" -Type String -Value "Deny"

#Disable "Let apps access your account info"
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" -Name "Value" -Type String -Value "Deny"

#Disable "Contacts access"
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" -Name "Value" -Type String -Value "Deny"

#Disable "Let apps access your contacts"
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" -Name "Value" -Type String -Value "Deny"

#Disable "Calendar access"
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" -Name "Value" -Type String -Value "Deny"

#Disable "Let apps access your calendar"
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" -Name "Value" -Type String -Value "Deny"

#Disable "Phone call access"
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall" -Name "Value" -Type String -Value "Deny"

#Disable "Let apps access your calendar"
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall" -Name "Value" -Type String -Value "Deny"

#Disable "Call history access"
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" -Name "Value" -Type String -Value "Deny"

#Disable "Let apps access your call history"
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" -Name "Value" -Type String -Value "Deny"

#Disable "Email access"
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" -Name "Value" -Type String -Value "Deny"

#Disable "Let apps access your email"
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" -Name "Value" -Type String -Value "Deny"

#Disable "Task access"
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" -Name "Value" -Type String -Value "Deny"

#Disable "Let apps access your tasks"
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" -Name "Value" -Type String -Value "Deny"

#Disable "Message access"
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" -Name "Value" -Type String -Value "Deny"

#Disable "Let apps read messages"
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" -Name "Value" -Type String -Value "Deny"

#Disable "Radio control access"
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" -Name "Value" -Type String -Value "Deny"

#Disable "Let apps read messages"
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" -Name "Value" -Type String -Value "Deny"

#Disable "Communicate with unpaired devices"
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync" -Name "Value" -Type String -Value "Deny"

#Disable "App diagnostic access"
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" -Name "Value" -Type String -Value "Deny"

#Disable "Let apps access diagnostic info about your other apps"
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" -Name "Value" -Type String -Value "Deny"

#Disable "Documents library access"
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" -Name "Value" -Type String -Value "Deny"

#Disable "Let apps access your documents library"
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" -Name "Value" -Type String -Value "Deny"

#Disable "Downloads folder access"
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\downloadsFolder" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\downloadsFolder" -Name "Value" -Type String -Value "Deny"

#Disable "Let apps access your downloads library"
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\downloadsFolder" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\downloadsFolder" -Name "Value" -Type String -Value "Deny"

#Disable "Allow access to music libraries on this device"
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\musicLibrary" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\musicLibrary" -Name "Value" -Type String -Value "Deny"

#Disable "Allow apps to access your music library"
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\musicLibrary" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\musicLibrary" -Name "Value" -Type String -Value "Deny"

#Disable "Picture library access"
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\picturesLibrary" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\picturesLibrary" -Name "Value" -Type String -Value "Deny"

#Disable "Let apps access your pictures library"
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\picturesLibrary" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\picturesLibrary" -Name "Value" -Type String -Value "Deny"

#Disable "Videos library access"
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videossLibrary" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videossLibrary" -Name "Value" -Type String -Value "Deny"

#Disable "Let apps access your videos library"
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary" -Name "Value" -Type String -Value "Deny"

#Disable "File system access"
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" -Name "Value" -Type String -Value "Deny"

#Disable "Let apps access your file system"
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" -Name "Value" -Type String -Value "Deny"

#Disable "Screenshot border settings access"
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\graphicsCaptureWithoutBorder" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\graphicsCaptureWithoutBorder" -Name "Value" -Type String -Value "Deny"

#Disable "Let apps turn off the screenshot border"
New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\graphicsCaptureWithoutBorder" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\graphicsCaptureWithoutBorder" -Name "Value" -Type String -Value "Deny"

#Disable "Let desktop apps turn off the screenshot border"
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\graphicsCaptureWithoutBorder\NonPackaged" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\graphicsCaptureWithoutBorder\NonPackaged" -Name "Value" -Type String -Value "Deny"

#Disable "Screenshots access"
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\graphicsCaptureProgrammatic" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\graphicsCaptureProgrammatic" -Name "Value" -Type String -Value "Deny"

#Disable "Let apps take screenshots of various windows and displays"
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\graphicsCaptureProgrammatic" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\graphicsCaptureProgrammatic" -Name "Value" -Type String -Value "Deny"

#Disable "Let desktop apps turn off the screenshot border"
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\graphicsCaptureProgrammatic\NonPackaged" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\graphicsCaptureProgrammatic\NonPackaged" -Name "Value" -Type String -Value "Deny"

#Disable "XBox Game Bar"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\GameBar" -Name "UseNexusForGameBarEnabled" -Value 0

#Disable "Game Capture"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" -Name "AppCaptureEnabled" -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" -Name "AudioCaptureEnabled" -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" -Name "CursorCaptureEnabled" -Value 0

#Enable "Gaming Mode"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\GameBar" -Name "AutoGameModeEnabled" -Value 1

Set-Service lfsvc -StartupType Disabled
Stop-Service -Name lfsvc -Force

Set-Service DiagTrack -StartupType Disabled
Stop-Service -Name DiagTrack -Force

Set-Service retaildemo -StartupType Disabled
Stop-Service -Name retaildemo -Force

Set-Service RemoteRegistry -StartupType Disabled
Stop-Service -Name RemoteRegistry -Force

Set-Service SSDPSRV -StartupType Disabled
Stop-Service -Name SSDPSRV -Force

Set-Service upnphost -StartupType Disabled
Stop-Service -Name upnphost -Force

Set-Service LanmanServer -StartupType Disabled
Stop-Service -Name LanmanServer -Force

Set-Service WSearch -StartupType Disabled
Stop-Service -Name WSearch -Force

#Remove OneDrive
TASKKILL /f /im OneDrive.exe
winget uninstall Microsoft.OneDrive --accept-source-agreements
'C:\Windows\SysWOW64\OneDriveSetup.exe /uninstall'
'C:\Windows\System32\OneDriveSetup.exe /uninstall'
Remove-Item "$env:USERPROFILE\OneDrive" -Force -Recurse
Remove-Item "$env:LOCALAPPDATA\OneDrive" -Force -Recurse
Remove-Item "$env:LOCALAPPDATA\Microsoft\OneDrive" -Force -Recurse
Remove-Item "$env:PROGRAMDATA\Microsoft OneDrive" -Force -Recurse
Remove-Item "$env:SYSTEMDRIVE\OneDriveTemp" -Force -Recurse
Remove-Item "$env:USERPROFILE\AppData\Local\Microsoft\OneDrive" -Force -Recurse

#Disable SNMP (CAT2 V-253276)
Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName SNMP -Remove

#Disable SimpleTCP (CAT2 V-253277)
Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName SimpleTCP -Remove

#Disable Telnet (CAT2 V-253278)
Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName TelnetClient -Remove

#Disable TFTP (CAT2 V-253279)
Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName TFTP -Remove

#Disable PrintToPDF Services
Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName Printing-PrintToPDFServices-Features -Remove

#Disable .NET Advanced Services
Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName WCF-Services45 -Remove
Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName WCF-TCP-PortSharing45 -Remove
Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName NetFx4-AdvSrvs -Remove

#Disable Windows Media Player
Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName MediaPlayback -Remove
Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName WindowsMediaPlayer -Remove

#Disable Work Folders
Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName WorkFolders-Client -Remove

#Disable Internet Printing
Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName Printing-Foundation-Features -Remove
Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName Printing-Foundation-InternetPrinting-Client -Remove

#Data Execution Prevention (DEP) to OptOut (CAT1 V-253283)
'c:\windows\system32\bcdedit.exe /set "{current}" nx OptOut'

#Enable Windows 11 Exploit Protection - SEHOPS (CAT2 V-253284)
Set-Processmitigation -System -Enable SEHOP

#Disable SMBv1 protocol (CAT2 V-253286, V-253287, V-253288)
Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName SMB1Protocol -Remove
Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName SMB1Protocol-Client -Remove
Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName SMB1Protocol-Server -Remove

#Vulnerability ID - V-253337
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application" -Name "MaxSize" -Value 32768

#Vulnerability ID - V-253338
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security" -Name "MaxSize" -Value 1024000

#Vulnerability ID - V-253339
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\System" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\System" -Name "MaxSize" -Value 32768

#Vulnerability ID - V-253350
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization" -Name "NoLockScreenCamera" -Value 1

#Vulnerability ID - V-2533352
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization" -Name "NoLockScreenSlideshow" -Value 1

#Vulnerability ID - V-253353
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" -Name "DisableSourceRouthing" -Value 2

#Vulnerability ID - V-253354
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "DisableSourceRouthing" -Value 2

#Vulnerability ID - V-253355
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "EnableICMPRedirect" -Value 0

#Vulnerability ID - V-253356
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\NetBT\Parameters" -Name "NoNameReleaseOnDemand" -Value 1

#Vulnerability ID - V-253357
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "LocalAccountTokenFilterPolicy" -Value 0

#Vulnerability ID - V-253358
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest" -Name "UseLogonCredential" -Value 0

#Vulnerability ID - V-253360
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LanmanWorkstation" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LanmanWorkstation" -Name "AllowInsecureGuestAuth" -Value 0

#Vulnerability ID - V-253361
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Network Connections" -Name "NC_ShowSharedAccessUI" -Value 0

#Vulnerability ID - V-253362
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths" -Name "\\\\*\\NETLOGON"="RequiredMutualAuthentication=1, RequireIntegrity=1"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths" -Name "\\\\*\\SYSVOL"="RequiredMutualAuthentication=1, RequireIntegrity=1"

#Vulnerability ID - V-253363
reg import "$env:USERPROFILE\Downloads\TBYPFWXI-Windows11-DISA-STIG-V1R2\ECC_Curves.reg"

#Vulnerability ID - V-253364
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy" -Name "fMinimizeConnections" -Value 1

#Vulnerability ID - V-253365
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy" -Name "fBlockNonDomain" -Value 1

#Vulnerability ID - V-253366
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config" -Name "AutoConnectAllowedOEM" -Value 1 -Force

#Vulnerability ID - V-253368
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation" -Name "AllowProtectedCreds" -Value 1

#Vulnerability ID - V-253369
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" -Name "EnableVirtualizationBasedSecurity" -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" -Name "RequirePlatformSecurityFeatures" -Value 1

#Vulnerability ID - V-253370
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" -Name "LsaCfgFlags" -Value 1

#Vulnerability ID - V-253371
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" -Name "HypervisorEnforcedCodeIntegrity" -Value 2

#Vulnerability ID - V-253372
New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Policies\EarlyLaunch"
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Policies\EarlyLaunch" -Name "DriverLoadPolicy" -Value 3

#Vulnerability ID - V-253373
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Goup Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Goup Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}" -Name NoGPOListChanges -Value 0

#Vulnerability ID - V-253374
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers" -Name DisableWebPnPDownload -Value 1

#Vulnerability ID - V-253375
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name NoWebServices -Value 1

#Vulnerability ID - V-253376
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers" -Name DisableHTTPPrinting -Value 1

#Vulnerability ID - V-253378
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name DontDisplayNetworkSelectionUI -Value 1

#Vulnerability ID - V-253379
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name EnumerateLocalUsers -Value 0

#Vulnerability ID - V-253380
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51" -Name DCSettingIndex -Value 1

#Vulnerability ID - V-253381
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51" -Name AcSettingIndex -Value 1

#Vulnerability ID - V-253382
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name fAllowToGetHelp -Value 0

#Vulnerability ID - V-253383
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Rpc" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Rpc" -Name RestrictRemoteClients -Value 1

#Vulnerability ID - V-253384
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name MSAOptional -Value 1

#Vulnerability ID - V-253385
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat" -Name DisableInventory -Value 1

#Vulnerability ID - V-253386
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name NoAutoplayfornonVolume -Value 1

#Vulnerability ID - V-253387
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name NoAutorun -Value 1

#Vulnerability ID - V-253388
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name NoDriveTypeAutoRun -Value 255

#Vulnerability ID - V-253389
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Biometrics\FacialFeatures" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Biometrics\FacialFeatures" -Name EnhancedAntiSpoofing -Value 1

#Vulnerability ID - V-253390
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Name DisableWindowsConsumerFeatures -Value 1

#Vulnerability ID - V-253391
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI" -Name EnumerateAdministrators -Value 0

#Vulnerability ID - V-253392
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name LimitEnhancedDiagnosticDataWindowsAnalytics -Value 1

#Vulnerability ID - V-253393
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name AllowTelemetry -Value 0

#Vulnerability ID - V-253394
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" -Name DODownloadMode -Value 0
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization\Config" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization\Config" -Name DODownloadMode -Value 0


#Vulnerability ID - V-253396
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name NoDataExecutionPrevention -Value 0

#Vulnerability ID - V-253397
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name NoHeapTerminationOnCorruption -Value 0

#Vulnerability ID - V-253398
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name PreXPSP2ShellProtocolBehavior -Value 0

#Vulnerability ID - V-253399
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR" -Name AllowGameDVR -Value 0

#Vulnerability ID - V-253400
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork" -Name RequireSecurityDevice -Value 1

#Vulnerability ID - V-253402
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name DisablePasswordSaving -Value 1

#Vulnerability ID - V-253403
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name fDisableCdm -Value 1

#Vulnerability ID - V-253404
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name fPromptForPassword -Value 1

#Vulnerability ID - V-253405
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name fEncryptRPCTraffic -Value 1

#Vulnerability ID - V-253406
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name MinEncryptionLevel -Value 3

#Vulnerability ID - V-253407
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Feeds" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Feeds" -Name DisableEnclosureDownload -Value 1

#Vulnerability ID - V-253408
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Feeds" -Name AllowBasicAuthInClear -Value 0

#Vulnerability ID - V-253409
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name AllowIndexingEncryptedStoresOrItems -Value 0

#Vulnerability ID - V-253410
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer" -Name EnableUserControl -Value 0

#Vulnerability ID - V-253411
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer" -Name AlwaysInstallElevated -Value 0

#Vulnerability ID - V-253412
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer" -Name SafeForScripting -Value 0

#Vulnerability ID - V-253413
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name DisableAutomaticRestartSignOn -Value 1

#Vulnerability ID - V-253416
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client" -Name AllowBasic -Value 0

#Vulnerability ID - V-253417
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client" -Name AllowUnencryptedTraffic -Value 0

#Vulnerability ID - V-253418
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service" -Name AllowBasic -Value 0

#Vulnerability ID - V-253419
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service" -Name AllowUnencryptedTraffic -Value 0

#Vulnerability ID - V-253420
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service" -Name DisableRunAs -Value 1

#Vulnerability ID - V-253421
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client" -Name AllowDigest -Value 0

#Vulnerability ID - V-253422
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" -Name LetAppsActivateWithVoiceAboveLock -Value 0

#Vulnerability ID - V-253423
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name AllowDomainPINLogon -Value 0

#Vulnerability ID - V-253424
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace" -Name AllowWindowsInkWorkspace -Value 1

#Vulnerability ID - V-253425
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\CloudContent" -Name DisableThirdPartySuggestions -Value 1

#Vulnerability ID - V-253426
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Kernel DMA Protection" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Kernel DMA Protection" -Name DeviceEnumerationPolicy -Value 0

#Vulnerability ID - V-253432
net user Administrator /active:no
net user xAdministrator /active:no

#Vulnerability ID - V-253433
net user guest /active:no
net user xguest /active:no

net user WDAGUtilityAccount /active:no
net user DefaultAccount /active:no

#Vulnerability ID - V-253434
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name LimitBlankPasswordUse -Value 1

#Vulnerability ID - V-253438
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" -Name RequireSignOrSeal -Value 1

#Vulnerability ID - V-253439
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" -Name SealSecureChannel -Value 1

#Vulnerability ID - V-253440
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" -Name SignSecureChannel -Value 1

#Vulnerability ID - V-253441
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" -Name DisablePasswordChange -Value 0

#Vulnerability ID - V-253442
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" -Name MaximumPasswordAge -Value 30

#Vulnerability ID - V-253443
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" -Name RequireStrongKey -Value 1

#Vulnerability ID - V-253447
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name CachedLogonsCount -Value 10

#Vulnerability ID - V-253449
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" -Name RequireSecuritySignature -Value 1

#Vulnerability ID - V-253450
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" -Name EnablePlainTextPassword -Value 0

#Vulnerability ID - V-253451
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -Name RequireSecuritySignature -Value 1

#Vulnerability ID - V-253453
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name RestrictAnonymousSAM -Value 1

#Vulnerability ID - V-253454
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name RestrictAnonymous -Value 1

#Vulnerability ID - V-253455
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name EveryoneIncludesAnonymous -Value 0

#Vulnerability ID - V-253456
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -Name RestrictNullSessAccess -Value 1

#Vulnerability ID - V-253457
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name RestrictRemoteSAM -Value "O:BAG:BAD:(A;;RC;;;BA)"

#Vulnerability ID - V-253458
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0" -Name allownullsessionfallback -Value 0

#Vulnerability ID - V-253459
New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\pku2u" -Force
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\pku2u" -Name AllowOnlineID -Value 0

#Vulnerability ID - V-253460
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters" -Name SupportedEncryptionTypes -Value 24

#Vulnerability ID - V-253461
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name NoLMHash -Value 1

#Vulnerability ID - V-253462
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name LmCompatibilityLevel -Value 5

#Vulnerability ID - V-253463
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\ldap" -Name LDAPClientIntegrity -Value 1

#Vulnerability ID - V-253464
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0" -Name NTLMMinClientSec -Value 537395200

#Vulnerability ID - V-253465
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0" -Name NTLMMinServerSec -Value 537395200

#Vulnerability ID - V-253466  May break some software, applications, and digital signature verification
#Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\FipsAlgorithmPolicy" -Name Enabled -Value 1

#Vulnerability ID - V-253467
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager" -Name ProtectionMode -Value 1

#Vulnerability ID - V-253468
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name FilterAdministratorToken -Value 1

#Vulnerability ID - V-253469
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name ConsentPromptBehaviorAdmin -Value 2

#Vulnerability ID - V-253471
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name ConsentPromptBehaviorUser -Value 0

#Vulnerability ID - V-253472
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name EnableInstallerDetection -Value 1

#Vulnerability ID - V-253473
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name EnableSecureUIAPaths -Value 1

#Vulnerability ID - V-253474
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name EnableLUA -Value 1

#Vulnerability ID - V-253475
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name EnableVirtualization -Value 1

#Vulnerability ID - V-253477
New-Item -Path "HKCU:\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" -Force
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" -Name NoToastApplicationNotificationOnLockScreen -Value 1

#Vulnerability ID - V-253478
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" -Name SaveZoneInformation -Value 2

###MS Defender Antivirus V2R4 STIG###
#Vulnerability ID - V-213426
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name PUAProtection -Value 1

#Vulnerability ID - V-213428
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name DisableRoutinelyTakingAction -Value 0

#Vulnerability ID - V-213429
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Exclusions" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Exclusions" -Name Exclusions_Paths -Value 0

#Vulnerability ID - V-213430
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Exclusions" -Name Exclusions_Processes -Value 0

#Vulnerability ID - V-213431
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Exclusions" -Name DisableAutoExclusions -Value 0

#Vulnerability ID - V-213432
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" -Name LocalSettingOverrideSpynetReporting -Value 0

#Vulnerability ID - V-213433
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" -Name DisableBlockAtFirstSeen -Value 0

#Vulnerability ID - V-213434
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" -Name SpynetReporting -Value 2

#Vulnerability ID - V-213435
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" -Name SubmitSamplesConsent -Value 1

#Vulnerability ID - V-213436
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\NIS" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\NIS" -Name DisableProtocolRecognition -Value 0

#Vulnerability ID - V-213437
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name LocalSettingOverrideDisableOnAccessProtection -Value 0

#Vulnerability ID - V-213438
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name LocalSettingOverrideRealtimeScanDirection -Value 0

#Vulnerability ID - V-213439
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name LocalSettingOverrideDisableIOAVProtection -Value 0

#Vulnerability ID - V-213440
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name LocalSettingOverrideDisableBehaviorMonitoring -Value 0

#Vulnerability ID - V-213441
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name LocalSettingOverrideDisableRealtimeMonitoring -Value 0

#Vulnerability ID - V-213442
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name RealtimeScanDirection -Value 0

#Vulnerability ID - V-213443
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name DisableOnAccessProtection -Value 0

#Vulnerability ID - V-213444
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name DisableIOAVProtection -Value 0

#Vulnerability ID - V-213445
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name DisableRealtimeMonitoring -Value 0

#Vulnerability ID - V-213446
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name DisableBehaviorMonitoring -Value 0

#Vulnerability ID - V-213447
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name DisableScanOnRealtimeEnable -Value 0

#Vulnerability ID - V-213448
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Scan" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Scan" -Name DisableArchiveScanning -Value 0

#Vulnerability ID - V-213449
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Scan" -Name DisableRemovableDriveScanning -Value 0

#Vulnerability ID - V-213450
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Scan" -Name ScheduleDay -Value 2

#Vulnerability ID - V-213451
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Scan" -Name DisableEmailScanning -Value 2

#Vulnerability ID - V-213452
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Signature Updates" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Signature Updates" -Name ASSignatureDue -Value 7

#Vulnerability ID - V-213453
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Signature Updates" -Name AVSignatureDue -Value 7

#Vulnerability ID - V-213454
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Signature Updates" -Name ScheduleDay -Value 0

#Vulnerability ID - V-213455
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Threats" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Threats" -Name "Threats_ThreatSeverityDefaultAction" -Value 1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Threats\ThreatSeverityDefaultAction" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Threats\ThreatSeverityDefaultAction" -Name "5" -Value 2 -Type String

#Vulnerability ID - V-213456
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR" -Name "ExploitGuard_ASR_Rules" -Value 1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules" -Name "BE9BA2D9-53EA-4CDC-84E5-9B1EEEE46550" -Value 1 -Type String

#Vulnerability ID - V-213457
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules" -Name "D4F940AB-401B-4EFC-AADC-AD5F3C50688A" -Value 1 -Type String

#Vulnerability ID - V-213458
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules" -Name "3B576869-A4EC-4529-8536-B80A7769E899" -Value 1 -Type String

#Vulnerability ID - V-213459
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules" -Name "75668C1F-73B5-4CF0-BB93-3ECF5CB7CC84" -Value 1 -Type String

#Vulnerability ID - V-213460
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules" -Name "D3E037E1-3EB8-44C8-A917-57927947596D" -Value 1 -Type String

#Vulnerability ID - V-213461
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules" -Name "5BEB7EFE-FD9A-4556-801D-275E5FFC04CC" -Value 1 -Type String

#Vulnerability ID - V-213462
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules" -Name "92E97FA1-2EDF-4476-BDD6-9DD0B4DDDC7B" -Value 1 -Type String

#Vulnerability ID - V-213463
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection" -Name "EnableNetworkProtection" -Value 1

#Vulnerability ID - V-213464
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Threats\ThreatSeverityDefaultAction" -Name "4" -Value 2 -Type String

#Vulnerability ID - V-213465
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Threats\ThreatSeverityDefaultAction" -Name "2" -Value 2 -Type String

#Vulnerability ID - V-213466
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Threats\ThreatSeverityDefaultAction" -Name "1" -Value 2 -Type String

###MS Windows Firewall STIG V2R1###
#Vulnerability ID - V-241989
netsh advfirewall set allprofiles state on
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall" -Name "PolicyVersion" -Value 220

New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile" -Name "DefaultInboundAction" -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile" -Name "DefaultOutboundAction" -Value 0
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile" -Name "DoNotAllowExceptions" -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile" -Name "EnableFirewall" -Value 1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging" -Name "LogFileSize" -Value 16384

New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile" -Name "DefaultInboundAction" -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile" -Name "DefaultOutboundAction" -Value 0
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile" -Name "DoNotAllowExceptions" -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile" -Name "EnableFirewall" -Value 1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging" -Name "LogFileSize" -Value 16384

New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile" -Name "DefaultInboundAction" -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile" -Name "DefaultOutboundAction" -Value 0
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile" -Name "DoNotAllowExceptions" -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile" -Name "EnableFirewall" -Value 1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging" -Name "LogFileSize" -Value 16384

#Vulnerability ID - V-242004
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile" -Name "AllowLocalPolicyMerge" -Value 0
#Vulnerability ID - V-242005
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile" -Name "AllowLocalIPsecPolicyMerge" -Value 0

##Disable IPv6##
Disable-NetAdapterBinding -Name 'Ethernet' -ComponentID 'ms_tcpip6'

##Disable File and Printer Sharing for Microsoft Networks##
Disable-NetAdapterBinding -Name 'Ethernet' -DisplayName "File and Printer Sharing for Microsoft Networks"

##Disable QOS Packet Scheduler##
Disable-NetAdapterBinding -Name 'Ethernet' -DisplayName "QOS Packet Scheduler"

##Disable Microsoft LLDP Protocol Driver##
Disable-NetAdapterBinding -Name 'Ethernet' -DisplayName "Microsoft LLDP Protocol Driver"

##Disable Link-Layer Topology Discover Responder##
Disable-NetAdapterBinding -Name 'Ethernet' -DisplayName "Link-Layer Topology Discovery Responder"

##Disable Link-Layer Topology Discover Mapper I/O Driver##
Disable-NetAdapterBinding -Name 'Ethernet' -DisplayName "Link-Layer Topology Discovery Mapper I/O Driver"

##Disable LMHOSTS Lookup##
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\NetBT\Parameters" -Name "EnableLMHosts" -Value 0

##Disable Netbios over TCP/IP##
$i = 'HKLM:\SYSTEM\CurrentControlSet\Services\netbt\Parameters\Interfaces'
Get-ChildItem $i | ForEach-Object {Set-ItemProperty -Path "$i\$($_.pschildname)" -name NetBiosOptions -Value 2}

##Set Display Sleep to NEVER##
powercfg -change -monitor-timeout-ac 0

#Hide Search in Taskbar
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name "SearchBoxTaskbarMode" -Value 0 -Force

#Hide Task View in Taskbar
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton" -Value 0 -Force

#Hide Widgets in Taskbar system wide
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Dsh" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Dsh" -Name "AllowNewsAndInterests" -Value 0 -Force

#Disable Badges on Taskbar
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarBadges" -Value 0 -Force

#Disable Flashing on Taskbar Apps
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarFlashing" -Value 0 -Force

#Disable Show recent searches when I hover over the search icon
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarSh" -Value 0 -Force

#Disable "Select the far corner of the taskbar to show the desktop"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarSd" -Value 0 -Force

#Disable Chat Icon in Taskbar
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarMn" -Value 0 -Force

#Taskbar Alignment to Left
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAl" -Value 0 -Force

#Disable Startup Sound
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\EditionOverrides" -Name "UserSetting_DisableStartupSound" -Value 1 -Force

#Disable sharing of handwriting data
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\TabletPC" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\TabletPC" -Name "PreventHandwritingDataSharing" -Value 1 -Force

#Disable sharing of handwriting error reports
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" -Name "PreventHandwritingErrorReports" -Value 1 -Force

#Disable and reset Advertising ID and info for the machine
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name "Enabled" -Value 0 -Force

#Disable advertments via Bluetooth
New-Item -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\current\device\Bluetooth" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\current\device\Bluetooth" -Name "AllowAdvertising" -Value 0 -Force

#Disable backup of text messages into the cloud
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Messaging" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Messaging" -Name "AllowMessageSync" -Value 0 -Force

#Disable Windows Error Reporting
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting" -Name "Disabled" -Value 1 -Force

#Disable Biometrical features
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Biometrics" -Name "Enabled" -Value 0 -Force

#Disable Recordings of user activity
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableActivityFeed" -Value 0 -Force

#Disable storage of clipboard history for entire machine
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "AllowClipboardHistory" -Value 0 -Force

#Disable the tranfer of clipboard to other devices via cloud
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "AllowCrossDeviceClipboard" -Value 0 -Force

#Disable app access to motion sensors
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore" -Name "Value" -Value "Deny" -Type String -Force

#Disable app access to unpaired devices
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync" -Name "Value" -Value "Deny" -Type String -Force

#Disable app access to videos
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary" -Name "Value" -Value "Deny" -Type String -Force

#Disable app acccess to unpaired devices
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore" -Name "Value" -Value "Deny" -Type String -Force

#Disable app acccess to eye tracking
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\gazeInput" -Name "Value" -Value "Deny" -Type String -Force

#Disable password reveal button
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredUI" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredUI" -Name "DisablePasswordReveal" -Value 1 -Force

#Disable user steps recorder
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat" -Name "DisableUAR" -Value 1 -Force

#Disable Internet access of Windwos Media Digital Rights Management (DRM)
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\WMDRM" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WMDRM" -Name "DisableOnline" -Value 1 -Force

#Disable Edge tracking in the web
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Edge" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Edge" -Name "ConfigureDoNotTrack" -Value 1 -Force

#Disable Edge check for saved payment methods by sites
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Edge" -Name "PaymentMethodQueryEnabled" -Value 0 -Force

#Disable Edge personalizing advertising, search, news and other services
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Edge" -Name "PersonalizationReportingEnabled" -Value 0 -Force

#Disable Edge automatic completion of web address in address bar
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Edge" -Name "AddressBarMicrosoftSearchInBingProviderEnabled" -Value 0 -Force

#Disable Edge user feedback in toolbar
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Edge" -Name "UserFeedbackAllowed" -Value 0 -Force

#Disable Edge storing and autocompleting of credit card data on websites
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Edge" -Name "AutofillCreditCardEnabled" -Value 0 -Force

#Disable Edge form suggestions
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Edge" -Name "AutofillAddressEnabled" -Value 0 -Force

#Disable Edge suggestions from local providers
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Edge" -Name "LocalProvidersEnabled" -Value 0 -Force

#Disable Edge search and website suggestions
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Edge" -Name "SearchSuggestEnabled" -Value 0 -Force

#Disable Edge shopping assistant
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Edge" -Name "EdgeShoppingAssistantEnabled" -Value 0 -Force

#Disable Edge bar
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Edge" -Name "WebWidgetAllowed" -Value 0 -Force

#Disable Edge use of web service to resolve navigation errors
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Edge" -Name "ResolveNavigationErrorsUseWebService" -Value 0 -Force

#Disable Edge suggestion of similar sites when website cannot be found
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Edge" -Name "AlternateErrorPagesEnabled" -Value 0 -Force

#Disable Edge preload of pages for faster browsing and searching
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Edge" -Name "NetworkPredictionOptions" -Value 2 -Force

#Disable Edge saving passwords for websites
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Edge" -Name "PasswordManagerEnabled" -Value 0 -Force

#Disable Edge sites safety services for more information about a visited website
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Edge" -Name "SiteSafetyServicesEnabled" -Value 0 -Force



#Enable typosquatting checker for site addresses
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Edge" -Name "TyposquattingCheckerEnabled" -Value 1 -Force

#Disable Edge (Legacy) automatic completion of web addresses in address bar
New-Item -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\current\device\Browser" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\current\device\Browser" -Name "AllowAddressBarDropdown" -Value 0 -Force

#Disable Cortana online speech recognition
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\InputPersonalization" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\InputPersonalization" -Name "AllowInputPersonalization" -Value 0 -Force

#Disable Cortana and search are disallowed to use location
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "AllowSearchToUseLocation" -Value 0 -Force

#Disable Cortana web search from Windows Desktop Search
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "DisableWebSearch" -Value 1 -Force

#Disable Cortana display web results in Search
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "ConnectedSearchUseWeb" -Value 0 -Force

#Disable Cortana download and updates of speech recognition and speech synthesis models
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Speech_OneCore\Preferences" -Name "ModelDownloadAllowed" -Value 0 -Force

#Disable Cortana cloud search
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "AllowCloudSearch" -Value 0 -Force

#Disable Cortana above lock screen
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "AllowCortanaAboveLock" -Value 0 -Force

#Disable Location Services functionality to locate the system
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" -Name "DisableLocation" -Value 1 -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" -Name "DisableWindowsLocationProvider" -Value 1 -Force

#Disable Location scripting functionality to locate the system
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" -Name "DisableLocationScripting" -Value 1 -Force

#Disable Location sensors for locating the system and its orientation
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" -Name "DisableSensors" -Value 1 -Force

#Disable Location Windows Geolocation Service
New-Item -Path "HKLM:\System\CurrentControlSet\Services\lfsvc\Service\Configuration" -Force
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\lfsvc\Service\Configuration" -Name "Status" -Value 0 -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" -Name "SensorPermissionState" -Value 0 -Force

#Disable User Behavior application telemetry
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0 -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name "AllowTelemetry" -Value 0 -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat" -Name "AITEnable" -Value 0 -Force

#Disable User Behavior diagnostic log collection
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "LimitDiagnosticLogCollection" -Value 1 -Force

#Disable User Behavior downloading of OneSetting configuration settings
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "DisableOneSettingsDownloads" -Value 1 -Force

#Disable Windows Update via peer-to-peer
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" -Name "DODownloadMode" -Value 0 -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" -Name "DODownloadMode" -Value 0
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization" -Name "SystemSettingsDownloadMode" -Value 0 -Force

#Disable Windows Update to the speech recognition and speech sythesi modules
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Speech" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Speech" -Name "AllowSpeechModelUpdate" -Value 0 -Force

#Disable OneDrive access to network before login
New-Item -Path "HKLM:\SOFTWARE\Microsoft\OneDrive" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\OneDrive" -Name "PreventNetworkTrafficPreUserSignIn" -Value 1 -Force

#Disable OneDrive
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive" -Name "DisableFileSyncNGSC" -Value 1 -Force

#Disable feedback reminders
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "DoNotShowFeedbackNotifications" -Value 1 -Force

#Disable automatic downloads and update of map data
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Maps" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Maps" -Name "AutoDownloadAndUpdateMapData" -Value 0 -Force

#Disable unsolicited network traffic on the offline maps setting page
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Maps" -Name "AllowUntriggeredNetworkTrafficOnSettingsPage" -Value 0 -Force

#Disable "Meet Now" in the taskbar
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "HideSCAMeetNow" -Value 1 -Force

#Disable new and interests in the taskbar
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" -Name "EnableFeeds" -Value 0 -Force

#Disable Current User transmission of typing information
Set-ItemProperty -Path "HKCU:\Software\Microsoft\input\TIPC" -Name "Enabled" -Value 0 -Force

#Disable Current User suggestions in the timeline
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-353698Enabled" -Value 0 -Force

#Disable Current User suggestions in Start
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338388Enabled" -Value 0 -Force

#Disable Current User possibility of suggesting to finish setup of the device
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement" -Name "ScoobeSystemSettingEnabled" -Value 0 -Force

#Disable Current User app notifications
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\PushNotifications" -Name "ToastEnabled" -Value 0 -Force

#Disable Current User text suggestions when typing on the software keyboard
Set-ItemProperty -Path "HKCU:\Software\Microsoft\TabletTip\1.7" -Name "EnableTextPrediction" -Value 0 -Force

#Disable Current User sending URLs from apps to Windows Store
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\AppHost" -Name "EnableWebContentEvaluation" -Value 0 -Force

#Disable Current User storage of clipboard history
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Clipboard" -Name "EnableClipboardHistory" -Value 0 -Force

#Disable Current User app access to device location
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Name "Value" -Value "Deny" -Type String -Force

#Disable Current User app access to use voice activation
New-Item -Path "HKCU:\Software\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps" -Name "AgentActivationEnabled" -Value 0 -Force

#Disable Current User app access to use voice activation when device is locked
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps" -Name "AgentActivationOnLockScreenEnabled" -Value 0 -Force

#Disable Current User standard app for the headset button
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps" -Name "AgentActivationLastUsed" -Value 0 -Force

#Disable Current User app access to motion sensors
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\activity" -Name "Value" -Value "Deny" -Type String -Force

#Disable app access to motion sensors
Set-ItemProperty -Path "HKLM:SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\activity" -Name "Value" -Value "Deny" -Type String -Force

#Disable Current User app access to unpaired devices
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\cellularData" -Name "Value" -Value "Deny" -Type String -Force

#Disable app access to unpaired devices
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\cellularData" -Name "Value" -Value "Deny" -Type String -Force

#Disable Current User app access to eye tracking
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\gazeInput" -Name "Value" -Value "Deny" -Type String -Force

#Disable Current User prohibit apps from running in the background
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" -Name "GlobalUserDisabled" -Value 1 -Force

#Disable Current User Edge tracking in the web
New-Item -Path "HKCU:\Software\Policies\Microsoft\Edge" -Force
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Edge" -Name "ConfigureDoNotTrack" -Value 1 -Force

#Disable Current User Edge check for saved payment methods by sites
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Edge" -Name "PaymentMethodQueryEnabled" -Value 0 -Force

#Disable Current User Edge personalizing advertising, search, news and other services
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Edge" -Name "PersonalizationReportingEnabled" -Value 0 -Force

#Disable Current User Edge automatic completion of web addresses in address bar
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Edge" -Name "AddressBarMicrosoftSearchInBingProviderEnabled" -Value 0 -Force

#Disable Current User Edge user feedback in toolbar
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Edge" -Name "UserFeedbackAllowed" -Value 0 -Force

#Disable Current User Edge storing and autocompleting of credit card data on websites
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Edge" -Name "AutofillCreditCardEnabled" -Value 0 -Force

#Disable Current User Edge form suggestions
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Edge" -Name "AutofillAddressEnabled" -Value 0 -Force

#Disable Current User Edge suggestions from local providers
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Edge" -Name "LocalProvidersEnabled" -Value 0 -Force

#Disable Current User Edge search and website suggestions
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Edge" -Name "SearchSuggestEnabled" -Value 0 -Force

#Disable Current User Edge shopping assistant
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Edge" -Name "EdgeShoppingAssistantEnabled" -Value 0 -Force

#Disable Current User Edge bar
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Edge" -Name "WebWidgetAllowed" -Value 0 -Force

#Disable Current User Edge use of web services to resolve navigation errors
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Edge" -Name "ResolveNavigationErrorsUseWebService" -Value 0 -Force

#Disable Current User Edge suggestion of similar sites when websites cannot be found
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Edge" -Name "AlternateErrorPagesEnabled" -Value 0 -Force

#Disable Current User Edge preload of pages for faster browsing and searching
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Edge" -Name "NetworkPredictionOptions" -Value 2 -Force

#Disable Current User Edge saving passwords for websites
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Edge" -Name "PasswordManagerEnabled" -Value 0 -Force

#Disable Current User Edge site safety services for more information about a visisted website
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Edge" -Name "SiteSafetyServicesEnabled" -Value 0 -Force



#Enable typosquatting checker for site addresses
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Edge" -Name "TyposquattingCheckerEnabled" -Value 1 -Force

#Disable Edge (Legacy version) tracking in the web
New-Item -Path "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main" -Force
Set-ItemProperty -Path "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main" -Name "DoNotTrack" -Value 1 -Force

#Disable Edge (Legacy version) page prediction
New-Item -Path "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\FlipAhead" -Force
Set-ItemProperty -Path "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\FlipAhead" -Name "FPEnabled" -Value 0 -Force

#Disable Edge (Legacy version) search and website suggestions
Set-ItemProperty -Path "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main" -Name "ShowSearchSuggestionsGlobal" -Value 0 -Force

#Disable Edge (Legacy version) Cortana in Microsoft Edge
New-Item -Path "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\ServiceUI" -Force
Set-ItemProperty -Path "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\ServiceUI" -Name "EnableCortana" -Value 0 -Force

#Disable Edge (Legacy version) showing search history
New-Item -Path "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\ServiceUI\ShowSearchHistory" -Force
Set-ItemProperty -Path "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\ServiceUI\ShowSearchHistory" -Name "(Default)" -Value 0 -Force

#Disable Edge (Legacy version) form suggestions
Set-ItemProperty -Path "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main" -Name "Use FormSuggest" -Value "no" -Type String -Force

#Disable Edge (Legacy version) sites saving protected media license on my device
New-Item -Path "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Privacy" -Force
Set-ItemProperty -Path "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Privacy" -Name "EnableEncryptedMediaExtensions" -Value 0 -Force

#Disable Edge (Legacy version) Do not optimize web search results on the taskbar for screen reader
Set-ItemProperty -Path "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main" -Name "OptimizeWindowsSearchResultsForScreenReaders" -Value 0 -Force


#Disable Sychronization of all settings
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SettingSync" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SettingSync" -Name "SyncPolicy" -Value 5 -Force

#Disable Sychronization of design settings
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Personalization" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Personalization" -Name "Enabled" -Value 0 -Force

#Disable Sychronization of browser settings
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\BrowserSettings" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\BrowserSettings" -Name "Enabled" -Value 0 -Force

#Disable Sychronization of credentials (passwords)
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials" -Name "Enabled" -Value 0 -Force

#Disable Sychronization of language settings
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language" -Name "Enabled" -Value 0 -Force

#Disable Sychronization of accessibility settings
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Accessibility" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Accessibility" -Name "Enabled" -Value 0 -Force

#Disable Sychronization of advanced Windows settings
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Windows" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Windows" -Name "Enabled" -Value 0 -Force

#Disable and reset Cortana
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Windows Search" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Windows Search" -Name "CortanaConsent" -Value 0 -Force

#Disable occasionally showing app suggestions in Start menu
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SystemPaneSuggestionsEnabled" -Value 0 -Force

#Disable recently opened items in Jump Lists on "Start" or the taskbar
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_TrackDocs" -Value 0 -Force

#Disable ads in Windows Explorer/OneDrive
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowSyncProviderNotifications" -Value 0 -Force

#Disable Lock Screen Windows Spotlight
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "RotatingLockScreenEnabled" -Value 0 -Force

#Disable fun facts, tips, tricks, and more on your lock screen
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "RotatingLockScreenOverlayEnabled" -Value 0 -Force

#Disable notifications on lock screen
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" -Name "NOC_GLOBAL_SETTING_ALLOW_TOASTS_ABOVE_LOCK" -Value 0 -Force

#Disable feedback reminders
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Siuf\Rules" -Name "NumberOfSIUFInPeriod" -Value 0 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Siuf\Rules" -Name "PeriodInNanoSeconds" -Value 0 -Force

#Disable automatic installation of recommended Windows Store Apps
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SilentInstalledAppsEnabled" -Value 0 -Force

#Disable tips, tricks, and suggestions while using Windows
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SoftLandingEnabled" -Value 0 -Force

#Disable extension of Windows search with Bing
New-Item -Path "HKCU:\Software\Policies\Microsoft\Windows\Explorer" -Force
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\Explorer" -Name "DisableSearchBoxSuggestions" -Value 1 -Force

#Disable People icon in the taskbar
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" -Name "PeopleBand" -Value 0 -Force

#Disable "Meet now" in the taskbar
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\Explorer" -Name "DisableSearchBoxSuggestions" -Value 1 -Force

#Disable extension of Windows search with Bing
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "HideSCAMeetNow" -Value 1 -Force

#Disable news and interests in the taskbar
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds" -Name "ShellFeedsTaskbarViewMode" -Value 2 -Force

 #renew files

# Set the desired root path for OneDrive folder (adjust as needed)
$OneDriveRoot = [System.Environment]::GetFolderPath("UserProfile") + "\OneDrive"

# Check if OneDrive folder exists
if (!(Test-Path -Path $OneDriveRoot)) {
    # If OneDrive folder doesn't exist, create it
    New-Item -Path $OneDriveRoot -ItemType Directory
    Write-Host "Recreated OneDrive folder at: $OneDriveRoot"
} else {
    Write-Host "OneDrive folder already exists at: $OneDriveRoot"
}

# Create the Desktop folder if it doesn't exist
$DesktopPath = Join-Path -Path $OneDriveRoot -ChildPath "Desktop"
if (!(Test-Path -Path $DesktopPath)) {
    New-Item -Path $DesktopPath -ItemType Directory
    Write-Host "Recreated missing Desktop folder at: $DesktopPath"
} else {
    Write-Host "Desktop folder already exists at: $DesktopPath"
}

# Create the Documents folder if it doesn't exist
$DocumentsPath = Join-Path -Path $OneDriveRoot -ChildPath "Documents"
if (!(Test-Path -Path $DocumentsPath)) {
    New-Item -Path $DocumentsPath -ItemType Directory
    Write-Host "Recreated missing Documents folder at: $DocumentsPath"
} else {
    Write-Host "Documents folder already exists at: $DocumentsPath"
}