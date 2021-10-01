# Variablen produktiver Tenant # 

$ClientID = $env:ClientId
$CertPath = $env:CertPath
$CertKey = $env:CertKey
$SpSiteUrl = "https://customercenterbrz365.sharepoint.com/sites/kundenportal"
$pass = (ConvertTo-SecureString -AsPlainText $CertKey -Force)
$Tenant="customercenterbrz365.onmicrosoft.com"
$xmlPath = '.\' + $templateName + '.xml'

# Verbindung produktiver Tenant #

Connect-PnPOnline -ClientId $ClientId -CertificatePath $CertPath -CertificatePassword $pass -Url $SpSiteUrl -Tenant $Tenant
Write-Host "Erfolgreich angemeldet"

# Ausrollen der Vorlage"

Set-PnpTenantSite -Identity $SpSiteUrl -DenyAddAndCustomizePages:$false
Invoke-PnPSiteTemplate -Path $xmlPath -ClearNavigation
Write-Host "Vorlage erfolgreich hochgeladen"

# Abmeldung produktiver Tenant #

Disconnect-PnPOnline
Write-Host "Erfolgreich abgemeldet"