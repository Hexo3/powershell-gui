# Saa kõik kettad ja nende info
$disks = Get-WmiObject Win32_LogicalDisk | Select-Object @{Name="Ketas |"; Expression={$_.DeviceID}}, @{Name="Maht (GB) |"; Expression={[math]::Round($_.Size / 1GB, 2)}}, @{Name="Vaba Ruum (GB)"; Expression={[math]::Round($_.FreeSpace / 1GB, 2)}}

# Automaatne vormindus
$output = $disks | Format-Table -AutoSize | Out-String
[System.Windows.Forms.MessageBox]::Show($output, "Kettaruumi Info", "OK", [System.Windows.Forms.MessageBoxIcon]::Information)
