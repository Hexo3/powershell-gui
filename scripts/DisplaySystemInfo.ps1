# Näitab süsteemi infot, võttes operatsioonisüsteemi objekti ja kuvades seal olevaid andmeid ümandades ram summa.
$os = Get-WmiObject -Class Win32_OperatingSystem
$computer = Get-WmiObject -Class Win32_ComputerSystem
$rounded_ram = [math]::Round($computer.TotalPhysicalMemory / 1GB, 2)
$system_info = "Operatsioonisüsteem: $($os.Caption) $($os.Version) $($os.OSArchitecture)`n" +
               "Tootja: $($computer.Manufacturer)`n" +
               "Mudel: $($computer.Model)`n" +
               "Protsessor: $($computer.Processor)`n" +
               "Mälu: $rounded_ram GB"
[System.Windows.Forms.MessageBox]::Show($system_info, "Süsteemi info")