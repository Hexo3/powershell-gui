# Lülita välja Windows Customer Experience Improvement Program (CEIP)
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\SQMClient\Windows" -Name "CEIPEnable" -Value 0 -Force

# Lülita välja Windows Error Reporting (WER)
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting" -Name "Disabled" -Value 1 -Force

# Lülita välja Application Telemetry
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0 -Force

# Lülita välja Connected User Experiences ja Telemetry Teenus
Set-Service "DiagTrack" -StartupType Disabled
Set-Service "dmwappushservice" -StartupType Disabled

# Peata Connected User Experiences ja Telemetry Teenus
Stop-Service "DiagTrack" -Force
Stop-Service "dmwappushservice" -Force

[System.Windows.MessageBox]::Show('Telemetria on välja lülitatud!', 'Välja lülitatud', 'OK', 'Informatsioon')