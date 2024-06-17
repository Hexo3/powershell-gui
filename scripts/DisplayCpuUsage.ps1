# Saa präegune protsessori kasutus ja ümarda summa kahe komakohaga
$cpuUsage = Get-Counter '\Processor(_Total)\% Processor Time' | Select-Object -ExpandProperty CounterSamples | Select-Object -ExpandProperty CookedValue
$rounded_cpuUsage = [math]::Round($cpuUsage, 2)
[System.Windows.Forms.MessageBox]::Show("Protsessori kasutus: $rounded_cpuUsage%", "Protsessori kasutus")

