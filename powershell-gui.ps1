Add-Type -AssemblyName System.Windows.Forms

$FormObject = [System.WIndows.Forms.Form]
$TabObject = [System.Windows.Forms.TabControl]
$TabPageObject = [System.Windows.Forms.TabPage]
$CheckBoxObject = [System.Windows.Forms.CheckBox]
$LabelObject = [System.Windows.Forms.Label]
$ButtonObject = [System.Windows.Forms.Button]
$TextObject = [System.Windows.Forms.TextBox]

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

# Peamine aken
############################################
$PsGuiTab1=New-Object $TabPageObject
$PsGuiTab1.Text='Peamine'
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
$PsGuiTab2.Text='Skriptid'
$PsGuiTab2.BackColor='#363636'
$PsGuiTab2.Font=$TitleFont




$PsGuiTabs.TabPages.Add($PsGuiTab2)
# Näita GUI vormi
$PsGuiForm.ShowDialog()

# Prügikorje (Eemaldab GUI programmi jäägid)
$PsGuiForm.Dispose()