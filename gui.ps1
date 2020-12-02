Add-Type -assembly System.Windows.Forms
$window_form = New-Object System.Windows.Forms.Form
$window_form.Text ="Пример 00000"
$window_form.Width = 500
$window_form.Height = 200
$window_form.AutoSize = $true

$FormLabel1 = New-Object System.Windows.Forms.Label
$FormLabel1.Text = "Select AD-user"
$FormLabel1.Location = New-Object System.Drawing.Point(0,10)
$FormLabel1.AutoSize = $true
$window_form.Controls.Add($FormLabel1)

$window_form.ShowDialog()