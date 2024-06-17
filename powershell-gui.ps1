Add-Type -AssemblyName System.Windows.Forms

$FormObject = [System.WIndows.Forms.Form]
$TabObject = [System.Windows.Forms.TabControl]
$TabPageObject = [System.Windows.Forms.TabPage]
$CheckBoxObject = [System.Windows.Forms.CheckBox]
$LabelObject = [System.Windows.Forms.Label]
$ComboBoxObject = [System.Windows.Forms.ComboBox]
$ButtonObject = [System.Windows.Forms.Button]
$TextBoxObject = [System.Windows.Forms.TextBox]

$TitleFont='Verdana,13'
$TextFont='Verdana,10'

# GUI baas
$PsGuiForm=New-Object $FormObject
$PsGuiForm.ClientSize='600,400'
$PsGuiForm.FormBorderStyle='FixedDialog'
$PsGuiForm.Text='PowerShell Toolbox - Indrek'
$PsGuiForm.Font=$TitleFont

# tab'ide aken
$PsGuiTabs=New-Object $TabObject
$PsGuiTabs.Location='0,0'
$PsGuiTabs.Size='600,400'
$PsGuiTabs.Font=$TitleFont
$PsGuiForm.Controls.Add($PsGuiTabs)

# Tarkvara paigalduse aken
############################################
$PsGuiTab1=New-Object $TabPageObject
$PsGuiTab1.Text='Tarkvara'
$PsGuiTab1.BackColor='#363636'
$PsGuiTab1.Font=$TitleFont

$lbltitle=New-Object $LabelObject
$lbltitle.Text='Tarkvara Paigaldamine'.toupper()
$lbltitle.AutoSize=$true
$lbltitle.ForeColor='#ffffff'
$lbltitle.Font=$TitleFont
$PsGuiTab1.Controls.Add($lbltitle)

# Valikuboksiga valikud

$checkbox1=New-Object $CheckBoxObject
$checkbox1.Location=New-Object System.Drawing.Point(20,50)
$checkbox1.Size=New-Object System.Drawing.Size(200,20)
$checkbox1.Text='Google Chrome'
$checkbox1.Font=$TextFont
$checkbox1.ForeColor='#ffffff'
$checkbox1.BackColor='#363636'
$PsGuiTab1.Controls.Add($checkbox1)
function GoogleChromeInstall {
    Start-Process "winget" -ArgumentList "install -e --id Google.Chrome" -Wait
}

$checkbox2=New-Object $CheckBoxObject
$checkbox2.Location=New-Object System.Drawing.Point(20,70)
$checkbox2.Size=New-Object System.Drawing.Size(200,20)
$checkbox2.Text='Brave Browser'
$checkbox2.Font=$TextFont
$checkbox2.ForeColor='#ffffff'
$checkbox2.BackColor='#363636'
$PsGuiTab1.Controls.Add($checkbox2)
function BraveBrowserInstall {
    Start-Process "winget" -ArgumentList "install -e --id BraveSoftware.BraveBrowser" -Wait
}

$checkbox3=New-Object $CheckBoxObject
$checkbox3.Location=New-Object System.Drawing.Point(20,90)
$checkbox3.Size=New-Object System.Drawing.Size(200,20)
$checkbox3.Text='Firefox'
$checkbox3.Font=$TextFont
$checkbox3.ForeColor='#ffffff'
$checkbox3.BackColor='#363636'
$PsGuiTab1.Controls.Add($checkbox3)
function FirefoxInstall {
    Start-Process "winget" -ArgumentList "install -e --id Mozilla.Firefox" -Wait
}

$checkbox4=New-Object $CheckBoxObject
$checkbox4.Location=New-Object System.Drawing.Point(20,110)
$checkbox4.Size=New-Object System.Drawing.Size(200,20)
$checkbox4.Text='Spotify'
$checkbox4.Font=$TextFont
$checkbox4.ForeColor='#ffffff'
$checkbox4.BackColor='#363636'
$PsGuiTab1.Controls.Add($checkbox4)
function SpotifyInstall {
    Start-Process "winget" -ArgumentList "install -e --id Spotify.Spotify" -Wait
}

$checkbox5=New-Object $CheckBoxObject
$checkbox5.Location=New-Object System.Drawing.Point(20,130)
$checkbox5.Size=New-Object System.Drawing.Size(200,20)
$checkbox5.Text='7-Zip'
$checkbox5.Font=$TextFont
$checkbox5.ForeColor='#ffffff'
$checkbox5.BackColor='#363636'
$PsGuiTab1.Controls.Add($checkbox5)
function ZipInstall {
    Start-Process "winget" -ArgumentList "install -e --id 7zip.7zip" -Wait
}

$install_button=New-Object $ButtonObject
$install_button.Location=New-Object System.Drawing.Point(20,160)
$install_button.Size=New-Object System.Drawing.Size(200,30)
$install_button.Text='Paigalda valitud tarkvara'
$install_button.Font=$TextFont
$install_button.ForeColor='#ffffff'
$install_button.BackColor='#686868'
$PsGuiTab1.Controls.Add($install_button)
# Kontrollib kas valikukast on valitud ja kui on siis paigaldab valitud tarkvara.
$install_button.Add_Click({
    if ($checkbox1.Checked) {
        GoogleChromeInstall
    }
    if ($checkbox2.Checked) {
        BraveBrowserInstall
    }
    if ($checkbox3.Checked) {
        FirefoxInstall
    }
    if ($checkbox4.Checked) {
        SpotifyInstall
    }
    if ($checkbox5.Checked) {
        ZipInstall
    }
})



$PsGuiTabs.TabPages.Add($PsGuiTab1)

# Skiptide aken
############################################
$PsGuiTab2=New-Object $TabPageObject
$PsGuiTab2.Text='Skriptid'.toupper()
$PsGuiTab2.BackColor='#363636'
$PsGuiTab2.Font=$TitleFont




$PsGuiTabs.TabPages.Add($PsGuiTab2)

# CLI aken
############################################
$PsGuiTab3=New-Object $TabPageObject
$PsGuiTab3.Text='CLI'.toupper()
$PsGuiTab3.BackColor='#363636'
$PsGuiTab3.Font=$TitleFont



$cli_textbox = New-Object $TextBoxObject
$cli_textbox.Text='Sisesta oma skript siia'
$cli_textbox.Font=$TextFont
$cli_textbox.Location=New-Object System.Drawing.Point(30,30)
$cli_textbox.Size=New-Object System.Drawing.Size(530,130)
$cli_textBox.Multiline=$true
$cli_textBox.ScrollBars='Vertical'
$cli_textBox.WordWrap=$true
$cli_textbox.ForeColor='#ffffff'
$cli_textbox.BackColor='#686868'

$PsGuiTab3.Controls.Add($cli_textbox)

$cli_output = New-Object $TextBoxObject
$cli_output.Text='Väljund'
$cli_output.Font=$TextFont
$cli_output.Location=New-Object System.Drawing.Point(30, 210)
$cli_output.Size=New-Object System.Drawing.Size(530,130)
$cli_output.Multiline=$true
$cli_output.ScrollBars='Vertical'
$cli_output.WordWrap=$true
$cli_output.ForeColor='#ffffff'
$cli_output.BackColor='#686868'
$PsGuiTab3.Controls.Add($cli_output)

$cli_run_script_button=New-Object $ButtonObject
$cli_run_script_button.Text='Stardi skript'
$cli_run_script_button.AutoSize=$true
$cli_run_script_button.Font=$TextFont
$cli_run_script_button.ForeColor='#ffffff'
$cli_run_script_button.Location=New-Object System.Drawing.Point(30,170)
$PsGuiTab3.Controls.Add($cli_run_script_button)

# Jooksutab tekstikastis oleva skripti powershellis
function RunScript{
    $custom_script = $cli_textbox.Text
    $cli_output.Text = Invoke-Expression -Command $custom_script
}
$cli_run_script_button.Add_Click({RunScript})

$PsGuiTabs.TabPages.Add($PsGuiTab3)

# Teenuste haldus
############################################
$PsGuiTab4=New-Object $TabPageObject
$PsGuiTab4.Text='Teenuste Haldus'.toupper()
$PsGuiTab4.BackColor='#363636'
$PsGuiTab4.Font=$TitleFont

# Teenuste vorm
$service_tab_label=New-Object $LabelObject
$service_tab_label.Text='Teenus:'.toupper()
$service_tab_label.Location=New-Object System.Drawing.Point(30,30)
$service_tab_label.AutoSize=$true
$service_tab_label.ForeColor='#ffffff'
$service_tab_label.Font=$TitleFont
$PsGuiTab4.Controls.Add($service_tab_label)

$service_tab_combo_box=New-Object $ComboBoxObject
$service_tab_combo_box.Width='300'
$service_tab_combo_box.Location=New-Object System.Drawing.Point(130,30)
$service_tab_combo_box.Text='Vali teenus'
$service_tab_combo_box.ForeColor='#000000'

#Lae teenused rippmenüüsse
Get-Service | ForEach-Object {$service_tab_combo_box.Items.Add($_.Name)}

$PsGuiTab4.Controls.Add($service_tab_combo_box)

#Teenuste info

$service_name_label=New-Object $LabelObject
$service_name_label.Text='Valitud teenuse nimi:'
$service_name_label.Font=$TitleFont
$service_name_label.ForeColor='#ffffff'
$service_name_label.AutoSize=$true
$service_name_label.Location=New-Object System.Drawing.Point(30,70)
$PsGuiTab4.Controls.Add($service_name_label)

$name_label=New-Object $LabelObject
$name_label.Text='N/A'
$name_label.ForeColor='#ffffff'
$name_label.AutoSize=$true
$name_label.Font=$TitleFont
$name_label.Location=New-Object System.Drawing.Point(240,70)
$PsGuiTab4.Controls.Add($name_label)

$service_status_label=New-Object $LabelObject
$service_status_label.Text='Staatus:'
$service_status_label.ForeColor='#ffffff'
$service_status_label.AutoSize=$true
$service_status_label.Location=New-Object System.Drawing.Point(30,100)
$PsGuiTab4.Controls.Add($service_status_label)

$status_label=New-Object $LabelObject
$status_label.Text='N/A'
$status_label.ForeColor='#ffffff'
$status_label.AutoSize=$true
$status_label.Location=New-Object System.Drawing.Point(240,100)
$PsGuiTab4.Controls.Add($status_label)

$service_start_button=New-Object $ButtonObject
$service_start_button.Text='Start Service'
$service_start_button.AutoSize=$true
$service_start_button.Font=$TextFont
$service_start_button.ForeColor='#ffffff'
$service_start_button.Location=New-Object System.Drawing.Point(30,140)
$PsGuiTab4.Controls.Add($service_start_button)

$service_stop_button=New-Object $ButtonObject
$service_stop_button.Text='Stop Service'
$service_stop_button.AutoSize=$true
$service_stop_button.Font=$TextFont
$service_stop_button.ForeColor='#ffffff'
$service_stop_button.Location=New-Object System.Drawing.Point(160,140)
$PsGuiTab4.Controls.Add($service_stop_button)

# Funktsioon teenuste staatuse ja nime saamiseks.
function GetServiceDetails{
    $ServiceName=$service_tab_combo_box.SelectedItem
    $details=Get-Service -Name $ServiceName | select *
    $name_label.Text=$details.name
    $status_label.Text=$details.status

    if($status_label.text -eq 'Running') {
    $status_label.ForeColor='green'
    } else {
    $status_label.ForeColor='red'
    }
}
$service_tab_combo_box.Add_SelectedIndexChanged({GetServiceDetails})

# Funktsioon Teenuse Käivitamiseks
function StartService {
    Start-Service -Name $name_label.Text
}
$service_start_button.Add_Click({StartService})

# Funktsioon Teenuse peatamiseks
function StopService{
    Stop-Service -Force -Name $name_label.Text
}
$service_stop_button.Add_Click({StopService})


$PsGuiTabs.TabPages.Add($PsGuiTab4)

# Näitab GUI vormi
############################################
$PsGuiForm.ShowDialog()

# Prügikorje (Eemaldab GUI programmi jäägid)
$PsGuiForm.Dispose()