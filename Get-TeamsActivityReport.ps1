#######################GraphAPI接続 start
$clientid = "<ClientID>"
$tenantName = "<your tenant name>.onmicrosoft.com"
$clientSecret = "<Secret ID>"

$ReqTokenBody = @{
    Grant_Type    = "client_credentials"
    Scope         = "https://graph.microsoft.com/.default"
    client_Id     = $clientID
    Client_Secret = $clientSecret
} 

$TokenResponse = Invoke-RestMethod -Uri "https://login.microsoftonline.com/$tenantName/oauth2/v2.0/token" -Method POST -Body $ReqTokenBody
#######################GraphAPI接続 end

#######################GraphAPIで情報取得
$apiUrl = "https://graph.microsoft.com/v1.0/reports/getTeamsUserActivityUserDetail(period='D30')"
#$apiUrl = 'https://graph.microsoft.com/beta/communications/callRecords/{会議ID}'

$Data = Invoke-RestMethod -Headers @{Authorization = "Bearer $($Tokenresponse.access_token)"} -Uri $apiUrl -Method Get
$Data | fl
