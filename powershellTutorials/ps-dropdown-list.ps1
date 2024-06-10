Add-Type -AssemblyName System.Windows.Forms

$FormObject = [System.Windows.Forms.Form]
$LabelObject = [System.Windows.Forms.Label]
$ComboBoxObject = [System.Windows.Forms.ComboBox]

$DefaultFont='Verdana,10'

#Set up base form
$AppForm=New-Object $FormObject
$AppForm.ClientSize='500,300'
$AppForm.Text='Lohh - Service Inspector'
$AppForm.BackColor='#ffffff'
$AppForm.Font=$DefaultFont

#Building the form
$lblService=New-Object $LabelObject
$lblService.Text='Services :'
$lblService.AutoSize=$true
$lblService.Location=New-Object System.Drawing.Point(20,20)

$ddlService=New-Object $ComboBoxObject
$ddlService.Width='300'
$ddlService.Location=New-Object System.Drawing.Point(125,20)

#Load the drop down list for services
Get-Service | ForEach-Object {$ddlService.Items.Add($_.Name)}

$ddlService.Text='Pick a service'

$lblForName=New-Object $LabelObject
$lblForName.Text='Service Friendly Name :'
$lblForName.AutoSize=$true
$lblForName.Location=New-Object System.Drawing.Point(20,80)

$lblName=New-Object $LabelObject
$lblName.Text='test'
$lblName.AutoSize=$true
$lblName.Location=New-Object System.Drawing.Point(240,80)

$lblForStatus=New-Object $LabelObject
$lblForStatus.Text='Status :'
$lblForStatus.AutoSize=$true
$lblForStatus.Location=New-Object System.Drawing.Point(20,120)

$lblStatus=New-Object $LabelObject
$lblStatus.Text='test'
$lblStatus.AutoSize=$true
$lblStatus.Location=New-Object System.Drawing.Point(240,120)

$AppForm.Controls.AddRange(@($lblService,$ddlService,$lblForName,$lblName,$lblForStatus,$lblStatus))

#Add some functions to this form

function GetServiceDetails{
    $ServiceName=$ddlService.SelectedItem
   $details=Get-Service -Name $ServiceName | select *
   $lblName.Text=$details.name
   $lblstatus.Text=$details.status

   if($lblstatus.text -eq 'Running') {
    $lblstatus.ForeColor='green'
   } else {
    $lblstatus.ForeColor='red'
   }
}

##Add functions to the controls

$ddlService.Add_SelectedIndexChanged({GetServiceDetails})

#Show the form
$AppForm.ShowDialog()

#Garbage Connection
$AppForm.Dispose()