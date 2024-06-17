# Tühjendab windows'i ajutised failid
$env:TEMP | Get-ChildItem -Force | Remove-Item -Force -Recurse
[System.Windows.MessageBox]::Show('Ajutised failid on kustutatud!', 'Kustutatud', 'OK', 'Informatsioon')