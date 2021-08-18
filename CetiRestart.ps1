#################################################################################
# CetiRestart.ps1 v.2                                                           #
#                                                                               #
#  CetiRestart.ps1 is intended to monitor last events and restart Ceti service  #
#  if no events have been logged in 24 hrs.                                     # 
#                                                                               #
#                     WRITTEN BY: Darryl G. Baker, CISSP, CEH                   #
#                                     for                                       #
#                         Tenable for AD Environments                           #
#################################################################################


Param(

[string]$uri = "",
[string]$key = ""
)

$token = @{'x-api-key'=$key}

While($true){
    $date = Get-Date
    $last = Invoke-RestMethod -Uri ($uri + "/api/events/last") -Method GET -Headers $token
        
        if($last.date -lt ($date.AddHours(-24))){
           #Send-MailMessage -To "admin@company.com" -From "Servicescript@company.com" -Subject "Ceti Restarting" -Body "T.ad Ceti Service Restarting" -SmtpServer <email server>
           Get-Service alsid_Ceti | Restart-Service   
           Start-Sleep -Seconds 86400    
        }
        
 }
 
  
# SIG # Begin signature block
# MIIFlAYJKoZIhvcNAQcCoIIFhTCCBYECAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUd20CKCD3HPCT1Qpa6+wJAJeZ
# jiOgggMiMIIDHjCCAgagAwIBAgIQO+B/uXgs+ZJDI4pFwa7Z0DANBgkqhkiG9w0B
# AQsFADAnMSUwIwYDVQQDDBxEYXJyeWwgRy4gQmFrZXIgQ29kZSBTaWduaW5nMB4X
# DTIxMDgxODE5NTcwMloXDTIyMDgxODIwMTcwMlowJzElMCMGA1UEAwwcRGFycnls
# IEcuIEJha2VyIENvZGUgU2lnbmluZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC
# AQoCggEBAKG7SowGauN0KCzcvXbxj5N9w6JrBU7OG3CqEh/5wCxvJ1CLAMIVa3lL
# +VqXxGS5iX/DbGt3NbvtCDcnu4OCCWDQkqM83NTZP84cD30O9JQblnxIwV1KLjXf
# p96NrOmAuhHHAbRITUxF5+dGZFfpJVp8Gi09GJf+DaEqSCzxu2Qw+g6NW9CWPRW0
# x0HGua95OcNHhNHOJLTTBg1ohtmo82mo5vMuniHIzM5j0sRqxj9vnNwQvTmgC/yq
# rRb3/u9XuPfGBnyR9mNw5po+MwOYenxShZgVv/UekL+oxBnt17r5TrUQfvWfKT7l
# i6pJ5+3Lose2Ave0ZVi4niNdzUi38mUCAwEAAaNGMEQwDgYDVR0PAQH/BAQDAgeA
# MBMGA1UdJQQMMAoGCCsGAQUFBwMDMB0GA1UdDgQWBBSd+ISqqC2sU6pmoZKlYLvJ
# 5a3vgDANBgkqhkiG9w0BAQsFAAOCAQEAY0P3VKNfGMKr+dqlEKjP8Ab95GZ++DZv
# yl4LmoCg0SLsgPoOgDzaaVkCu/OYSsScY9lkZqUO4T37hqdJpiI7FHi7hWWdGJFH
# /x/sQFJwUwuF4zJCCBv33YfJtrs42upbN1xSb3yUof61RTMhe2ZBp8DbfiPhsHI/
# +VZBqWy3FTUTj7XUng09B3gEv55mwEgPaGbUktAOK6fV8AVPtEksHqMllmcjLCeL
# nA6miV7eu+JGCNX/AO6Cvz2BIYMday06B1uVAMu+4NAI7A0kbmPJ7vZ2nXoCqN/y
# 1UrpGuO3EnXLsjYq5skJdNVmmFBTnlpMeM3a0e2I2fvYIkQ0m63CvjGCAdwwggHY
# AgEBMDswJzElMCMGA1UEAwwcRGFycnlsIEcuIEJha2VyIENvZGUgU2lnbmluZwIQ
# O+B/uXgs+ZJDI4pFwa7Z0DAJBgUrDgMCGgUAoHgwGAYKKwYBBAGCNwIBDDEKMAig
# AoAAoQKAADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgEL
# MQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUN+4veXmFfBrmq8/fCrD7
# 0nGQJEQwDQYJKoZIhvcNAQEBBQAEggEAECVHfGZgFdOB0jTtMtLNG9HnBy90ta4T
# KLEIfdAFtLduEhb+HCscMwoC9z4ryJ93vSgOXRMXrGZg5o9+0z4hXiqajezWXN50
# H1m6nxKHXOoCMT7K8r801MICCwtZKVf2XuXEE2NsTbFKsheiT089PR0faWjnmKrB
# xEoverMCH5vywm/ZHIGUqKhOTZdob+z8WRt8qmP6XME9Ls/QRL7DWQMIa09rvr1G
# VUlDcJe26boqfFjP588NsXeB75YON+WdzzfI/HL+ZJ6oZM1OBo4GrL321eXxeZD1
# ynDUPJxgvXG7oJlK3EVna+jblXmc2mVT8A9zO611BAdvhyPlyGw0YQ==
# SIG # End signature block
