# Näitab süsteemi mälukasutust ning ümbardab selle kahe komakohaga
$memoryUsage = Get-Counter '\Memory\Available MBytes' | Select-Object -ExpandProperty CounterSamples | Select-Object -ExpandProperty CookedValue
#MB to GB
$memoryUsage = $memoryUsage / 1024
$rounded_memoryUsage = [math]::Round($memoryUsage, 2)
[System.Windows.Forms.MessageBox]::Show("Mälu kasutus: $rounded_memoryUsage GB", "Mälu kasutus")