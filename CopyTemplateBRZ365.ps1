# Variablen Test-Tenant # 

$ClientID = $env:ClientId
$CertPath = $env:CertPath
$CertKey = $env:CertKey
$SpSiteUrl = "https://customercenterbrz365test.sharepoint.com/sites/kundenportal"
$pass = (ConvertTo-SecureString -AsPlainText $CertKey -Force)
$Tenant="customercenterbrz365test.onmicrosoft.com"
$xmlPath = '.\' + $templateName + '.xml'

# Verbindung Test-Tenant #

Connect-PnPOnline -ClientId $ClientId -CertificatePath $CertPath -CertificatePassword $pass -Url $SpSiteUrl -Tenant $Tenant
Write-Host "Erfolgreich angemeldet"

# Download Status Quo Test-Tenant"

Get-PnPSiteTemplate -Out $xmlPath -Force
Write-Host "Vorlage erfolgreich heruntergeladen"

# Abmeldung Test-Tenant #

Disconnect-PnPOnline
Write-Host "Erfolgreich abgemeldet"