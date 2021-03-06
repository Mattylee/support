$EXE_URL = "https://s3.amazonaws.com/jumpcloud-windows-agent/production/adint.exe"
$EXE_FILEPATH = "C:\\Program Files\\JumpCloud AD Bridge\\adint.exe"
$TMP_FILEPATH = "C:\\Windows\\Temp\\adint.exe"

$ErrorActionPreference = "Stop"
"Updating JumpCloud AD Bridge to latest version..."

# stop the AD Bridge service:
& Stop-Service adint

"Downloading AD Bridge update..."
# check the PowerShell version: Invoke-WebRequest is a PowerShell 3 command, so use WebClient on earlier versions:
$PSVersionExists = Test-Path variable:global:PSVersionTable
If ($PSVersionExists -eq $true -And $PSVersionTable.PSVersion.Major -ge 3) {
& Invoke-WebRequest $EXE_URL -OutFile $TMP_FILEPATH
}
Else { # on anything less that PS3, use WebClient:
$WebClient = New-Object System.Net.WebClient
$WebClient.DownloadFile($EXE_URL, $TMP_FILEPATH)
}
"Download successful. Updating AD Bridge agent..."

# copy file to final destination and remove tmp file:
copy $TMP_FILEPATH $EXE_FILEPATH
del $TMP_FILEPATH

# restart the service:
& Start-Service adint
"AD Bridge Agent updated successfully."

# SIG # Begin signature block
# MIIXtQYJKoZIhvcNAQcCoIIXpjCCF6ICAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUvuNZgdHwJTLd64DsM8hGHx3b
# pGCgghLwMIID7jCCA1egAwIBAgIQfpPr+3zGTlnqS5p31Ab8OzANBgkqhkiG9w0B
# AQUFADCBizELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdlc3Rlcm4gQ2FwZTEUMBIG
# A1UEBxMLRHVyYmFudmlsbGUxDzANBgNVBAoTBlRoYXd0ZTEdMBsGA1UECxMUVGhh
# d3RlIENlcnRpZmljYXRpb24xHzAdBgNVBAMTFlRoYXd0ZSBUaW1lc3RhbXBpbmcg
# Q0EwHhcNMTIxMjIxMDAwMDAwWhcNMjAxMjMwMjM1OTU5WjBeMQswCQYDVQQGEwJV
# UzEdMBsGA1UEChMUU3ltYW50ZWMgQ29ycG9yYXRpb24xMDAuBgNVBAMTJ1N5bWFu
# dGVjIFRpbWUgU3RhbXBpbmcgU2VydmljZXMgQ0EgLSBHMjCCASIwDQYJKoZIhvcN
# AQEBBQADggEPADCCAQoCggEBALGss0lUS5ccEgrYJXmRIlcqb9y4JsRDc2vCvy5Q
# WvsUwnaOQwElQ7Sh4kX06Ld7w3TMIte0lAAC903tv7S3RCRrzV9FO9FEzkMScxeC
# i2m0K8uZHqxyGyZNcR+xMd37UWECU6aq9UksBXhFpS+JzueZ5/6M4lc/PcaS3Er4
# ezPkeQr78HWIQZz/xQNRmarXbJ+TaYdlKYOFwmAUxMjJOxTawIHwHw103pIiq8r3
# +3R8J+b3Sht/p8OeLa6K6qbmqicWfWH3mHERvOJQoUvlXfrlDqcsn6plINPYlujI
# fKVOSET/GeJEB5IL12iEgF1qeGRFzWBGflTBE3zFefHJwXECAwEAAaOB+jCB9zAd
# BgNVHQ4EFgQUX5r1blzMzHSa1N197z/b7EyALt0wMgYIKwYBBQUHAQEEJjAkMCIG
# CCsGAQUFBzABhhZodHRwOi8vb2NzcC50aGF3dGUuY29tMBIGA1UdEwEB/wQIMAYB
# Af8CAQAwPwYDVR0fBDgwNjA0oDKgMIYuaHR0cDovL2NybC50aGF3dGUuY29tL1Ro
# YXd0ZVRpbWVzdGFtcGluZ0NBLmNybDATBgNVHSUEDDAKBggrBgEFBQcDCDAOBgNV
# HQ8BAf8EBAMCAQYwKAYDVR0RBCEwH6QdMBsxGTAXBgNVBAMTEFRpbWVTdGFtcC0y
# MDQ4LTEwDQYJKoZIhvcNAQEFBQADgYEAAwmbj3nvf1kwqu9otfrjCR27T4IGXTdf
# plKfFo3qHJIJRG71betYfDDo+WmNI3MLEm9Hqa45EfgqsZuwGsOO61mWAK3ODE2y
# 0DGmCFwqevzieh1XTKhlGOl5QGIllm7HxzdqgyEIjkHq3dlXPx13SYcqFgZepjhq
# IhKjURmDfrYwggSjMIIDi6ADAgECAhAOz/Q4yP6/NW4E2GqYGxpQMA0GCSqGSIb3
# DQEBBQUAMF4xCzAJBgNVBAYTAlVTMR0wGwYDVQQKExRTeW1hbnRlYyBDb3Jwb3Jh
# dGlvbjEwMC4GA1UEAxMnU3ltYW50ZWMgVGltZSBTdGFtcGluZyBTZXJ2aWNlcyBD
# QSAtIEcyMB4XDTEyMTAxODAwMDAwMFoXDTIwMTIyOTIzNTk1OVowYjELMAkGA1UE
# BhMCVVMxHTAbBgNVBAoTFFN5bWFudGVjIENvcnBvcmF0aW9uMTQwMgYDVQQDEytT
# eW1hbnRlYyBUaW1lIFN0YW1waW5nIFNlcnZpY2VzIFNpZ25lciAtIEc0MIIBIjAN
# BgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAomMLOUS4uyOnREm7Dv+h8GEKU5Ow
# mNutLA9KxW7/hjxTVQ8VzgQ/K/2plpbZvmF5C1vJTIZ25eBDSyKV7sIrQ8Gf2Gi0
# jkBP7oU4uRHFI/JkWPAVMm9OV6GuiKQC1yoezUvh3WPVF4kyW7BemVqonShQDhfu
# ltthO0VRHc8SVguSR/yrrvZmPUescHLnkudfzRC5xINklBm9JYDh6NIipdC6Anqh
# d5NbZcPuF3S8QYYq3AhMjJKMkS2ed0QfaNaodHfbDlsyi1aLM73ZY8hJnTrFxeoz
# C9Lxoxv0i77Zs1eLO94Ep3oisiSuLsdwxb5OgyYI+wu9qU+ZCOEQKHKqzQIDAQAB
# o4IBVzCCAVMwDAYDVR0TAQH/BAIwADAWBgNVHSUBAf8EDDAKBggrBgEFBQcDCDAO
# BgNVHQ8BAf8EBAMCB4AwcwYIKwYBBQUHAQEEZzBlMCoGCCsGAQUFBzABhh5odHRw
# Oi8vdHMtb2NzcC53cy5zeW1hbnRlYy5jb20wNwYIKwYBBQUHMAKGK2h0dHA6Ly90
# cy1haWEud3Muc3ltYW50ZWMuY29tL3Rzcy1jYS1nMi5jZXIwPAYDVR0fBDUwMzAx
# oC+gLYYraHR0cDovL3RzLWNybC53cy5zeW1hbnRlYy5jb20vdHNzLWNhLWcyLmNy
# bDAoBgNVHREEITAfpB0wGzEZMBcGA1UEAxMQVGltZVN0YW1wLTIwNDgtMjAdBgNV
# HQ4EFgQURsZpow5KFB7VTNpSYxc/Xja8DeYwHwYDVR0jBBgwFoAUX5r1blzMzHSa
# 1N197z/b7EyALt0wDQYJKoZIhvcNAQEFBQADggEBAHg7tJEqAEzwj2IwN3ijhCcH
# bxiy3iXcoNSUA6qGTiWfmkADHN3O43nLIWgG2rYytG2/9CwmYzPkSWRtDebDZw73
# BaQ1bHyJFsbpst+y6d0gxnEPzZV03LZc3r03H0N45ni1zSgEIKOq8UvEiCmRDoDR
# EfzdXHZuT14ORUZBbg2w6jiasTraCXEQ/Bx5tIB7rGn0/Zy2DBYr8X9bCT2bW+IW
# yhOBbQAuOA2oKY8s4bL0WqkBrxWcLC9JG9siu8P+eJRRw4axgohd8D20UaF5Mysu
# e7ncIAkTcetqGVvP6KUwVyyJST+5z3/Jvz4iaGNTmr1pdKzFHTx/kuDDvBzYBHUw
# ggUfMIIEB6ADAgECAhAIZIjN0psNNCyIsIBsGSCGMA0GCSqGSIb3DQEBCwUAMHIx
# CzAJBgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3
# dy5kaWdpY2VydC5jb20xMTAvBgNVBAMTKERpZ2lDZXJ0IFNIQTIgQXNzdXJlZCBJ
# RCBDb2RlIFNpZ25pbmcgQ0EwHhcNMTQxMDIzMDAwMDAwWhcNMTcxMDI3MTIwMDAw
# WjBmMQswCQYDVQQGEwJVUzERMA8GA1UECBMIQ29sb3JhZG8xEDAOBgNVBAcTB0Jv
# dWxkZXIxGDAWBgNVBAoTD0p1bXBDbG91ZCwgSW5jLjEYMBYGA1UEAxMPSnVtcENs
# b3VkLCBJbmMuMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA1jM2906m
# B+amHdJ1+dXoEs854tzsYer9J/JJHNngMhPIpjAaGr3ovabY6jX2V9xq0CqNPVzx
# xejMk99umiap/GusHknSm3RbwIX1gTDFqf49YM6Fs/0ue0UWDqP1YaX4Fhgjt1XX
# Z6leiNoPNu8DUeJxRFGyhLxIKYmscWLUUTZKigZ1K+bJBrpsMcD0x8DmzGpGcCiY
# MenC/NCZ4bQwfjH6JI63V9xMJEds6yVSqNTaI7rOjiPXeONmC84v8aewoZzCpYV5
# YvaSExsNYlq7e2BwXg4NcH0zTJyMoSrXCgLj7eqeEBQzzzl4yDUo5Bg7B9/CbgQ+
# 1IZmDg2phJ6yCwIDAQABo4IBuzCCAbcwHwYDVR0jBBgwFoAUWsS5eyoKo6XqcQPA
# YPkt9mV1DlgwHQYDVR0OBBYEFMwJIMN1e0QU5FA+qDqpaOc0eEfUMA4GA1UdDwEB
# /wQEAwIHgDATBgNVHSUEDDAKBggrBgEFBQcDAzB3BgNVHR8EcDBuMDWgM6Axhi9o
# dHRwOi8vY3JsMy5kaWdpY2VydC5jb20vc2hhMi1hc3N1cmVkLWNzLWcxLmNybDA1
# oDOgMYYvaHR0cDovL2NybDQuZGlnaWNlcnQuY29tL3NoYTItYXNzdXJlZC1jcy1n
# MS5jcmwwQgYDVR0gBDswOTA3BglghkgBhv1sAwEwKjAoBggrBgEFBQcCARYcaHR0
# cHM6Ly93d3cuZGlnaWNlcnQuY29tL0NQUzCBhAYIKwYBBQUHAQEEeDB2MCQGCCsG
# AQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wTgYIKwYBBQUHMAKGQmh0
# dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydFNIQTJBc3N1cmVkSURD
# b2RlU2lnbmluZ0NBLmNydDAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBCwUAA4IB
# AQC9bkD3xyNlqbeaom6XJZEQKBl+zOK1J/bOW4uShipj9SdzVcSQwU1qsooEK8+b
# 0LPFfl9HlwQhxmvHZVDuVsCQ95OjouUTGptH23NpVdTkrllmTctV5+ToWCzSgayf
# h8QXCbtgaQm/IgwZHFc6/AkIebEb4v/QYAAgoJYwVKuXIafbb9AA4GyjOjUCLBta
# /eyr0JwHENLWon/sEWZ65e0qYDV9oU/LLa17KD2agZIinpWrLCb+DQkKHRViLCto
# /uuLObbIU272XcqYGIMTCC9rStF+fV77ldlgZ5DDN+DPifMp1JYsnDYtdPeMw4IF
# yfhJqdgYns8cCtwtQk8a5+3CMIIFMDCCBBigAwIBAgIQBAkYG1/Vu2Z1U0O1b5VQ
# CDANBgkqhkiG9w0BAQsFADBlMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNl
# cnQgSW5jMRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMSQwIgYDVQQDExtEaWdp
# Q2VydCBBc3N1cmVkIElEIFJvb3QgQ0EwHhcNMTMxMDIyMTIwMDAwWhcNMjgxMDIy
# MTIwMDAwWjByMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkw
# FwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMTEwLwYDVQQDEyhEaWdpQ2VydCBTSEEy
# IEFzc3VyZWQgSUQgQ29kZSBTaWduaW5nIENBMIIBIjANBgkqhkiG9w0BAQEFAAOC
# AQ8AMIIBCgKCAQEA+NOzHH8OEa9ndwfTCzFJGc/Q+0WZsTrbRPV/5aid2zLXcep2
# nQUut4/6kkPApfmJ1DcZ17aq8JyGpdglrA55KDp+6dFn08b7KSfH03sjlOSRI5aQ
# d4L5oYQjZhJUM1B0sSgmuyRpwsJS8hRniolF1C2ho+mILCCVrhxKhwjfDPXiTWAY
# vqrEsq5wMWYzcT6scKKrzn/pfMuSoeU7MRzP6vIK5Fe7SrXpdOYr/mzLfnQ5Ng2Q
# 7+S1TqSp6moKq4TzrGdOtcT3jNEgJSPrCGQ+UpbB8g8S9MWOD8Gi6CxR93O8vYWx
# YoNzQYIH5DiLanMg0A9kczyen6Yzqf0Z3yWT0QIDAQABo4IBzTCCAckwEgYDVR0T
# AQH/BAgwBgEB/wIBADAOBgNVHQ8BAf8EBAMCAYYwEwYDVR0lBAwwCgYIKwYBBQUH
# AwMweQYIKwYBBQUHAQEEbTBrMCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5kaWdp
# Y2VydC5jb20wQwYIKwYBBQUHMAKGN2h0dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNv
# bS9EaWdpQ2VydEFzc3VyZWRJRFJvb3RDQS5jcnQwgYEGA1UdHwR6MHgwOqA4oDaG
# NGh0dHA6Ly9jcmw0LmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRJRFJvb3RD
# QS5jcmwwOqA4oDaGNGh0dHA6Ly9jcmwzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFz
# c3VyZWRJRFJvb3RDQS5jcmwwTwYDVR0gBEgwRjA4BgpghkgBhv1sAAIEMCowKAYI
# KwYBBQUHAgEWHGh0dHBzOi8vd3d3LmRpZ2ljZXJ0LmNvbS9DUFMwCgYIYIZIAYb9
# bAMwHQYDVR0OBBYEFFrEuXsqCqOl6nEDwGD5LfZldQ5YMB8GA1UdIwQYMBaAFEXr
# oq/0ksuCMS1Ri6enIZ3zbcgPMA0GCSqGSIb3DQEBCwUAA4IBAQA+7A1aJLPzItEV
# yCx8JSl2qB1dHC06GsTvMGHXfgtg/cM9D8Svi/3vKt8gVTew4fbRknUPUbRupY5a
# 4l4kgU4QpO4/cY5jDhNLrddfRHnzNhQGivecRk5c/5CxGwcOkRX7uq+1UcKNJK4k
# xscnKqEpKBo6cSgCPC6Ro8AlEeKcFEehemhor5unXCBc2XGxDI+7qPjFEmifz0DL
# QESlE/DmZAwlCEIysjaKJAL+L3J+HNdJRZboWR3p+nRka7LrZkPas7CM1ekN3fYB
# IM6ZMWM9CBoYs4GbT8aTEAb8B4H6i9r5gkn3Ym6hU/oSlBiFLpKR6mhsRDKyZqHn
# GKSaZFHvMYIELzCCBCsCAQEwgYYwcjELMAkGA1UEBhMCVVMxFTATBgNVBAoTDERp
# Z2lDZXJ0IEluYzEZMBcGA1UECxMQd3d3LmRpZ2ljZXJ0LmNvbTExMC8GA1UEAxMo
# RGlnaUNlcnQgU0hBMiBBc3N1cmVkIElEIENvZGUgU2lnbmluZyBDQQIQCGSIzdKb
# DTQsiLCAbBkghjAJBgUrDgMCGgUAoHAwEAYKKwYBBAGCNwIBDDECMAAwGQYJKoZI
# hvcNAQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcC
# ARUwIwYJKoZIhvcNAQkEMRYEFHmH97tkVbImBMXQRfLCh/5bw+EJMA0GCSqGSIb3
# DQEBAQUABIIBAAhCMd2fwh+zqLqiSFBTD2+v/iVfWwN3NwAXaNufCT8D/6S0hmNX
# P6slpJ0N8MT/99bkPw7QIZGX7fRZqSikzeso0rXBGfiB5/kGJZ+moyRMAGuWLorz
# /IYOYkq86G7h/5c/zzFZp+aIpLACdY9o5AcrycLTGUfsTWSkjWQhdDIS3mLHY771
# 0QcXt6zPQumYsvwDp4R7ZM8x6b8Gd2b+3rOoqWVTOHdzVAZJFOmVkCiW+DnygQIV
# jZm22VO1eSCG8cXAng1/bOKHF+pcx8uarUN1A4Fz00jCy9PcG/B531ZLFLc1/jpl
# fwWYsqxDIu/MerBwxTlDWl/Qj9NPGIrul26hggILMIICBwYJKoZIhvcNAQkGMYIB
# +DCCAfQCAQEwcjBeMQswCQYDVQQGEwJVUzEdMBsGA1UEChMUU3ltYW50ZWMgQ29y
# cG9yYXRpb24xMDAuBgNVBAMTJ1N5bWFudGVjIFRpbWUgU3RhbXBpbmcgU2Vydmlj
# ZXMgQ0EgLSBHMgIQDs/0OMj+vzVuBNhqmBsaUDAJBgUrDgMCGgUAoF0wGAYJKoZI
# hvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTcwODExMTYxMTM5
# WjAjBgkqhkiG9w0BCQQxFgQUdd+tAtdkpZGXufKZJQiWmDWsZjswDQYJKoZIhvcN
# AQEBBQAEggEAQ3jhopwScIhLkBTuPHuYWW0wGTn30lfZRE9BAMU/vnq0MMhecpkS
# iKi+PzjjKhvwxIrHIe67WEqiAPVjUp4XQuspMs8y68Vr96lRIdEPVlnckBR1P1z6
# 4vK7EtL3CUTmjs093vnUGkZdoIQ7RhWEg5hy8muT0IxhqUKlDFQWvH/3V6zPrD2H
# QR1TgYe5KCfOzOjuBv08pjaGhgLOoj97rElAWp+Dxaeu0wgdXN5Xy2Nl56J4GELj
# /bzdvGWLysBc6856bfDnMfLHLCM522z2zINoaFRkM9GNMMTLx7rij3KyGWGVPgT3
# v4ge9J4TpLpOJ8mZ4rSHePhJ7vC3qVjPBw==
# SIG # End signature block
