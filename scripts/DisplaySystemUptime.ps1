# Saab süsteemi tööaja
$os = Get-WmiObject -Class Win32_OperatingSystem
$uptime = (Get-Date) - $os.ConvertToDateTime($os.LastBootUpTime)
$system_uptime = "{0} päeva, {1} tundi, {2} minutit, {3} sekundit" -f $uptime.Days, $uptime.Hours, $uptime.Minutes, $uptime.Seconds
[System.Windows.Forms.MessageBox]::Show("Süsteemi tööaeg: $system_uptime", "Süsteemi tööaeg")