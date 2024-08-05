# GUI created with POSHGUI.com, a free online PowerShell GUI tool.

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
[System.Windows.Forms.Application]::EnableVisualStyles()

$bulkChecker                     = New-Object system.Windows.Forms.Form
$bulkChecker.ClientSize          = New-Object System.Drawing.Size(433, 722)
$bulkChecker.Text                = "AbuseIPDB Bulk Checker"
$bulkChecker.TopMost             = $false
$bulkChecker.BackColor           = [System.Drawing.ColorTranslator]::FromHtml("#2C3E50") # Dark background
$bulkChecker.FormBorderStyle     = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$bulkChecker.StartPosition       = [System.Windows.Forms.FormStartPosition]::CenterScreen

function AddGradient {
    param ($control, $color1, $color2)
    $control.Paint.Add({
        $g = $_.Graphics
        $brush = New-Object System.Drawing.Drawing2D.LinearGradientBrush($_.ClipRectangle, $color1, $color2, 90)
        $g.FillRectangle($brush, $_.ClipRectangle)
        $brush.Dispose()
    })
}

AddGradient -control $bulkChecker -color1 [System.Drawing.ColorTranslator]::FromHtml("#34495E") -color2 [System.Drawing.ColorTranslator]::FromHtml("#2C3E50")

$APIKeyLabel                     = New-Object system.Windows.Forms.Label
$APIKeyLabel.Text                = "API Key"
$APIKeyLabel.AutoSize            = $true
$APIKeyLabel.Width               = 100
$APIKeyLabel.Height              = 20
$APIKeyLabel.Location            = New-Object System.Drawing.Point(28, 140)
$APIKeyLabel.Font                = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)
$APIKeyLabel.ForeColor           = [System.Drawing.ColorTranslator]::FromHtml("#ECF0F1") # Light text color

$InputFilePathLabel              = New-Object system.Windows.Forms.Label
$InputFilePathLabel.Text         = "CSV Input File Path / Name"
$InputFilePathLabel.AutoSize     = $true
$InputFilePathLabel.Width        = 200
$InputFilePathLabel.Height       = 20
$InputFilePathLabel.Location     = New-Object System.Drawing.Point(28, 196)
$InputFilePathLabel.Font         = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)
$InputFilePathLabel.ForeColor    = [System.Drawing.ColorTranslator]::FromHtml("#ECF0F1") # Light text color

$csvPathTextBox                  = New-Object system.Windows.Forms.TextBox
$csvPathTextBox.Multiline        = $false
$csvPathTextBox.Width            = 300
$csvPathTextBox.Height           = 30
$csvPathTextBox.Location         = New-Object System.Drawing.Point(28, 221)
$csvPathTextBox.Font             = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)
$csvPathTextBox.BackColor        = [System.Drawing.ColorTranslator]::FromHtml("#34495E") # Darker background for textbox
$csvPathTextBox.ForeColor        = [System.Drawing.ColorTranslator]::FromHtml("#ECF0F1") # Light text color

$browseCsvPath                   = New-Object system.Windows.Forms.Button
$browseCsvPath.Text              = "Browse"
$browseCsvPath.Width             = 90
$browseCsvPath.Height            = 30
$browseCsvPath.Location          = New-Object System.Drawing.Point(335, 221)
$browseCsvPath.Font              = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)
$browseCsvPath.BackColor         = [System.Drawing.ColorTranslator]::FromHtml("#3498DB") # Blue button
$browseCsvPath.ForeColor         = [System.Drawing.ColorTranslator]::FromHtml("#ECF0F1") # Light text color

$exportPathLabel                 = New-Object system.Windows.Forms.Label
$exportPathLabel.Text            = "CSV Export File Path / Name"
$exportPathLabel.AutoSize        = $true
$exportPathLabel.Width           = 200
$exportPathLabel.Height          = 20
$exportPathLabel.Location        = New-Object System.Drawing.Point(28, 265)
$exportPathLabel.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)
$exportPathLabel.ForeColor       = [System.Drawing.ColorTranslator]::FromHtml("#ECF0F1") # Light text color

$exportPathTextBox               = New-Object system.Windows.Forms.TextBox
$exportPathTextBox.Multiline     = $false
$exportPathTextBox.Width         = 300
$exportPathTextBox.Height        = 30
$exportPathTextBox.Location      = New-Object System.Drawing.Point(28, 287)
$exportPathTextBox.Font          = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)
$exportPathTextBox.BackColor     = [System.Drawing.ColorTranslator]::FromHtml("#34495E") # Darker background for textbox
$exportPathTextBox.ForeColor     = [System.Drawing.ColorTranslator]::FromHtml("#ECF0F1") # Light text color

$browseExportPath                = New-Object system.Windows.Forms.Button
$browseExportPath.Text           = "Browse"
$browseExportPath.Width          = 90
$browseExportPath.Height         = 30
$browseExportPath.Location       = New-Object System.Drawing.Point(335, 287)
$browseExportPath.Font           = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)
$browseExportPath.BackColor      = [System.Drawing.ColorTranslator]::FromHtml("#3498DB") # Blue button
$browseExportPath.ForeColor      = [System.Drawing.ColorTranslator]::FromHtml("#ECF0F1") # Light text color

$AbuseIPDBLink                   = New-Object system.Windows.Forms.Button
$AbuseIPDBLink.Text              = "No key? Click here"
$AbuseIPDBLink.Width             = 160
$AbuseIPDBLink.Height            = 36
$AbuseIPDBLink.Location          = New-Object System.Drawing.Point(200, 150)
$AbuseIPDBLink.Font              = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)
$AbuseIPDBLink.BackColor         = [System.Drawing.ColorTranslator]::FromHtml("#3498DB") # Blue button
$AbuseIPDBLink.ForeColor         = [System.Drawing.ColorTranslator]::FromHtml("#ECF0F1") # Light text color

$outputLabel                     = New-Object system.Windows.Forms.Label
$outputLabel.Text                = "Output"
$outputLabel.AutoSize            = $true
$outputLabel.Width               = 100
$outputLabel.Height              = 30
$outputLabel.Location            = New-Object System.Drawing.Point(28, 360)
$outputLabel.Font                = New-Object System.Drawing.Font('Microsoft Sans Serif', 16)
$outputLabel.ForeColor           = [System.Drawing.ColorTranslator]::FromHtml("#ECF0F1") # Light text color

$inputLabel                      = New-Object system.Windows.Forms.Label
$inputLabel.Text                 = "Input"
$inputLabel.AutoSize             = $true
$inputLabel.Width                = 100
$inputLabel.Height               = 30
$inputLabel.Location             = New-Object System.Drawing.Point(28, 100)
$inputLabel.Font                 = New-Object System.Drawing.Font('Microsoft Sans Serif', 16)
$inputLabel.ForeColor            = [System.Drawing.ColorTranslator]::FromHtml("#ECF0F1") # Light text color

$topTitle                        = New-Object system.Windows.Forms.Label
$topTitle.Text                   = "AbuseIPDB Bulk Checker"
$topTitle.AutoSize               = $true
$topTitle.Width                  = 300
$topTitle.Height                 = 30
$topTitle.Location               = New-Object System.Drawing.Point(28, 20)
$topTitle.Font                   = New-Object System.Drawing.Font('Sylfaen', 18, [System.Drawing.FontStyle]::Bold)
$topTitle.ForeColor              = [System.Drawing.ColorTranslator]::FromHtml("#ECF0F1") # Light text color

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.Text                     = "the legend"
$Label1.AutoSize                 = $true
$Label1.Width                    = 100
$Label1.Height                   = 20
$Label1.Location                 = New-Object System.Drawing.Point(320, 20)
$Label1.Font                     = New-Object System.Drawing.Font('Jokerman', 12, [System.Drawing.FontStyle]::Italic)
$Label1.ForeColor                = [System.Drawing.ColorTranslator]::FromHtml("#E74C3C") # Red color

$ToolTip2                        = New-Object system.Windows.Forms.ToolTip
$ToolTip2.ToolTipTitle           = "Unleash the bulk check"
$ToolTip2.IsBalloon              = $false

$outputBox                       = New-Object system.Windows.Forms.TextBox
$outputBox.Multiline             = $true
$outputBox.Width                 = 370
$outputBox.Height                = 100
$outputBox.Location              = New-Object System.Drawing.Point(28, 395)
$outputBox.ScrollBars            = "Vertical"
$outputBox.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)
$outputBox.BackColor             = [System.Drawing.ColorTranslator]::FromHtml("#34495E") # Darker background for textbox
$outputBox.ForeColor             = [System.Drawing.ColorTranslator]::FromHtml("#ECF0F1") # Light text color

$outputProgress                  = New-Object system.Windows.Forms.ProgressBar
$outputProgress.Location         = New-Object System.Drawing.Point(28, 530)
$outputProgress.Width            = 370
$outputProgress.Height           = 30
$outputProgress.Style            = 'Continuous'
$outputProgress.ForeColor        = [System.Drawing.ColorTranslator]::FromHtml("#2ECC71") # Green color

$currentIPBox                    = New-Object system.Windows.Forms.TextBox
$currentIPBox.Multiline          = $false
$currentIPBox.Width              = 370
$currentIPBox.Height             = 30
$currentIPBox.Location           = New-Object System.Drawing.Point(28, 570)
$currentIPBox.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)
$currentIPBox.BackColor          = [System.Drawing.ColorTranslator]::FromHtml("#34495E") # Darker background for textbox
$currentIPBox.ForeColor          = [System.Drawing.ColorTranslator]::FromHtml("#ECF0F1") # Light text color

$Run                             = New-Object system.Windows.Forms.Button
$Run.text                        = "Run"
$Run.width                       = 116
$Run.height                      = 60
$Run.location                    = New-Object System.Drawing.Point(34, 648)
$Run.Font                        = New-Object System.Drawing.Font('Microsoft Sans Serif', 12)
$Run.BackColor                   = [System.Drawing.ColorTranslator]::FromHtml("#2ECC71") # Green button
$Run.ForeColor                   = [System.Drawing.ColorTranslator]::FromHtml("#ECF0F1") # Light text color

$Exit                            = New-Object system.Windows.Forms.Button
$Exit.text                       = "Run Away!"
$Exit.width                      = 116
$Exit.height                     = 60
$Exit.location                   = New-Object System.Drawing.Point(220, 648)
$Exit.Font                       = New-Object System.Drawing.Font('Microsoft Sans Serif', 12)
$Exit.BackColor                  = [System.Drawing.ColorTranslator]::FromHtml("#E74C3C") # Red button
$Exit.ForeColor                  = [System.Drawing.ColorTranslator]::FromHtml("#ECF0F1") # Light text color

$apiKeyTextBox                   = New-Object system.Windows.Forms.TextBox
$apiKeyTextBox.Multiline         = $false
$apiKeyTextBox.Width             = 225
$apiKeyTextBox.Height            = 20
$apiKeyTextBox.Location          = New-Object System.Drawing.Point(22, 155)
$apiKeyTextBox.Font              = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)
$apiKeyTextBox.BackColor         = [System.Drawing.ColorTranslator]::FromHtml("#34495E") # Darker background for textbox
$apiKeyTextBox.ForeColor         = [System.Drawing.ColorTranslator]::FromHtml("#ECF0F1") # Light text color

$currentIPBox                    = New-Object system.Windows.Forms.TextBox
$currentIPBox.Multiline          = $false
$currentIPBox.Width              = 200
$currentIPBox.Height             = 22
$currentIPBox.Location           = New-Object System.Drawing.Point(92, 487)
$currentIPBox.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)
$currentIPBox.BackColor          = [System.Drawing.ColorTranslator]::FromHtml("#34495E") # Darker background for textbox
$currentIPBox.ForeColor          = [System.Drawing.ColorTranslator]::FromHtml("#ECF0F1") # Light text color

$bulkChecker.controls.AddRange(@(
    $APIKeyLabel, $InputFilePathLabel, $csvPathTextBox, $browseCsvPath,
    $exportPathLabel, $exportPathTextBox, $browseExportPath,
    $AbuseIPDBLink, $outputLabel, $inputLabel, $topTitle, $Label1, $outputBox,
    $outputProgress, $Run, $Exit, $apiKeyTextBox, $currentIPBox
))

# Animating the progress bar for visual feedback
function AnimateProgressBar {
    param($progressBar)
    for ($i = 1; $i -le $progressBar.Maximum; $i++) {
        $progressBar.Value = $i
        Start-Sleep -Milliseconds 10
    }
}

# Call this function whenever you update the progress bar
function UpdateProgressBar {
    param($progressBar, $value)
    $progressBar.Value = $value
}

$Run.Add_Click({
    setApiKey
    setCsvPath
    setExportPath
    clearOutputBox
    setProgressBar
    startOutput
    # Run the animation once when starting the check
    AnimateProgressBar -progressBar $outputProgress
    bulkCheck
})

$browseCsvPath.Add_Click({
    $csvPathTextBox.Text = getCsvName -initialDirectory $csvPathTextBox.Text
})

$browseExportPath.Add_Click({
    $exportPathTextBox.Text = Get-Folder
})

$AbuseIPDBLink.Add_Click({
    keyLogin
})

$Exit.Add_Click({
    exitProgram
})

function setApiKey #sets API key to input box value
{
    $global:apiKey = $apiKeyTextBox.Text
}

function getCsvName #Browse functionality for input path
{
     $csvFileDialog = New-Object System.Windows.Forms.OpenFileDialog
     $csvFileDialog.initialDirectory = $initialDirectory
     $csvFileDialog.filter = "CSV (*.CSV)| *.CSV"
     $csvFileDialog.ShowDialog() | Out-Null
     $csvFileDialog.filename
}

function setCsvPath #Sets CSV Path variable to input box value
{ 
    $global:csvPath= $csvPathTextBox.Text
    $global:ipTotal= (Get-Content $csvPath).Length #Total number of IPs to check
}

function setExportPath #Sets Export Path variable to input box value
{
    $global:exportPath = $exportPathTextBox.Text
}

function clearOutputBox #Clear output box and line count
{
    $global:lineCount=1
    $outputBox.Text=""
}

function setProgressBar #Sets up the progress bar in output
{
    $outputProgress.Maximum = $ipTotal
    $outputProgress.Step = 1
    $outputProgress.Value = 1
}

function outputText #Bottom output text box
{
    $outputBox.Text += "Checking $lineCount of $ipTotal IP addresses `r`n"
}

function showProgressBar #Shows progress bar and text directly below
{
    $outputProgress.PerformStep()
    $currentIPBox.Text = "Checking $lineCount of $ipTotal IP addresses"
}

function startOutput #Initial timestamp and output
{
    $global:startTime=Get-Date -format HH:mm:ss
    $outputBox.Text = "Started check of $ipTotal IPs at $startTime `r`n"
}

function endOutput #Post-check output and statistics
{
    $endTime=Get-Date -format HH:mm:ss
    $outputBox.Text += "Completed check at $endTime `r`n"
    $global:timeElapsed = New-Timespan -Start $startTime -End $endTime
    $global:timeElapsedMinutes = $timeElapsed.Minutes
    $global:timeElapsedSeconds = $timeElapsed.Seconds
    $global:timePerIP = [math]::Round(($timeElapsedSeconds / $ipTotal), 2)
    $outputBox.Text += "Time elapsed was $timeElapsedMinutes minutes and $timeElapsedSeconds seconds `r`n"
    $outputBox.Text += "Average time per IP checked was $timePerIP seconds `r`n `r`n"
    $outputBox.Text += "The Admiralty commends you for your efforts!"
}

function exitProgram #Run Away button functionality
{
    $bulkChecker.close()
}

function bulkCheck {
    $jsonTempPath= New-TemporaryFile #Results are initially returned as JSON, stored in temporary file
    setExportPath
    setApiKey
    setCsvPath
    clearOutputBox
    setProgressBar
    startOutput
    Import-csv $csvPath -Header "IP" | ForEach {
        if($_.IP -as [ipAddress] -as [Bool]) { # Check if it's an IP Address
            Invoke-WebRequest -Uri ("https://api.abuseipdb.com/api/v2/check?ipAddress=$($_.IP)") -Headers @{'Accept' = 'application/json'; 'Key' = $ApiKey} -usebasicparsing | add-content -path $jsonTempPath
        } else {
            throw "$($_.IP) is not a valid IP!" # Throw an error showing which IP is invalid
        }
        showProgressBar
        $global:lineCount++
    }
    endOutput #Show end output and statistics
    Get-content $jsonTempPath | ConvertFrom-Json | select -ExpandProperty Data | select ipAddress, abuseConfidenceScore, isp, domain, countryCode, totalReports, lastReportedAt | ConvertTo-CSV -NoTypeInformation | add-content $exportPath #Create CSV output file
}

function keyLogin { #URL link to AbuseIPDB site
    $linkProcess = New-Object System.Diagnostics.ProcessStartInfo
    $linkProcess.FileName = "https://www.abuseipdb.com/account/api"
    $linkProcess.UseShellExecute = $true
    [System.Diagnostics.Process]::Start($linkProcess)
}

function Get-Folder { #Folder browsing
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null
    [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") | Out-Null
    $BrowseForm = New-Object System.Windows.Forms.FolderBrowserDialog
    $BrowseForm.ShowDialog() | Out-Null
    $BrowseForm.SelectedPath
}

$bulkChecker.Add_Shown({ $bulkChecker.Activate() })
[void] $bulkChecker.ShowDialog()
