# todo : something usefull or not or yes
#  test2
Add-Type -assembly System.Windows.Forms
$window_form = New-Object System.Windows.Forms.Form
$window_form.Text ="Пример 00000"
$window_form.Width = 500
$window_form.Height = 200
$window_form.AutoSize = $true

$FormLabel1 = New-Object System.Windows.Forms.Label
$FormLabel1.Text = "Папко-файл"
$FormLabel1.Location = New-Object System.Drawing.Point(0,10)
$FormLabel1.AutoSize = $true
$window_form.Controls.Add($FormLabel1)

$FormComboBox = New-Object System.Windows.Forms.ComboBox
$FormComboBox.Width = 250


write-host 'list folder'; 
$ODItems = Get-ChildItem -Path $env:OneDrive ; 
$ODitemsArray = @(); 

write-host 'foreach'; 

Foreach ($Item in $ODItems){
    $Obj = New-Object System.Object; 
    $Obj | Add-Member -type NoteProperty -Name Length -Value $Item.Length; 
    $Obj | Add-Member -type NoteProperty -Name Name -Value $Item.Name; 
#    $FormComboBox.Items.Add($Obj);
    $ODitemsArray += $Obj ;  
}
$FormComboBox.Items.AddRange($ODitemsArray); 
$FormComboBox.DisplayMember = 'Name'; 
$FormComboBox.ValueMember = 'Length'; 


write-host 'foreach ended'; 

$FormComboBox.Location = New-Object System.Drawing.Point(80,10)
$window_form.Controls.Add($FormComboBox)


$FormLabel2 = New-Object System.Windows.Forms.Label
$FormLabel2.Text = "Последний доступ:"
$FormLabel2.Location = New-Object System.Drawing.Point(0,40)
$FormLabel2.AutoSize = $true
$window_form.Controls.Add($FormLabel2)

$FormLabel3 = New-Object System.Windows.Forms.Label
$FormLabel3.Text = ""
$FormLabel3.Location = New-Object System.Drawing.Point(140,60)
$FormLabel3.AutoSize = $true
$window_form.Controls.Add($FormLabel3)

$FormButton = New-Object System.Windows.Forms.Button
$FormButton.Location = New-Object System.Drawing.Size(400,10)
$FormButton.Size = New-Object System.Drawing.Size(100,20)
$FormButton.Text = "Проверить"
$FormButton.Add_Click( 
    {
        $FormLabel3.Text = $FormComboBox.SelectedItem.Length; 
    }
);
$window_form.Controls.Add($FormButton); 

write-host 'listBox'; 
$listBox = New-Object System.Windows.Forms.ListBox; 
$listBox.Location = New-Object System.Drawing.Point(10, 80); 
$listBox.Size = New-Object System.Drawing.Size(260,20); 
$listBox.Height = 80; 
$listBox.Items.AddRange($ODitemsArray); 
$listBox.ValueMember = "Length"
$listBox.DisplayMember = "Name"
$window_form.Controls.Add($listBox); 

write-host 'dialog'; 

$window_form.ShowDialog()
