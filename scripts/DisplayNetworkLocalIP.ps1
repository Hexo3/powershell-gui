# Leia info võrguadapterist, kus address on ipv4 ja tegu ei ole loopback interface'iga
$networkAdapters = Get-NetIPAddress | Where-Object { $_.AddressFamily -eq 'IPv4' -and $_.InterfaceAlias -ne 'Loopback' }

# Kontrolli, kas leiti võrguadaptereid
if ($networkAdapters) {
    # Võta võrguadapterist esimene väärtus
    $ipv4Address = $networkAdapters[0].IPAddress

    # muutuja ipv4 addressiga
    $message = "Lokaalne IPv4 Address: $ipv4Address"

    # Kuva tekstikast, koos IPv4 addressiga
    [System.Windows.MessageBox]::Show($message, "Lokaalne IPv4 Address", "OK", "Information")
} else {
    # Kui IP addressi ei leitud, kuva teade
    [System.Windows.MessageBox]::Show("IPv4 addressi ei leitud.", "Lokaalne IPv4 Address", "OK", "Hoiatus")
}
