# GUI created with POSHGUI.com, a free online PowerShell GUI tool.

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
[System.Windows.Forms.Application]::EnableVisualStyles()

$bulkChecker                     = New-Object system.Windows.Forms.Form
$bulkChecker.ClientSize          = New-Object System.Drawing.Point(433,722)
$bulkChecker.text                = "AbuseIPDB Bulk Checker"
$bulkChecker.TopMost             = $false
$bulkChecker.BackColor           = [System.Drawing.ColorTranslator]::FromHtml("#2C3E50") # Dark background
$bulkChecker.FormBorderStyle     = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$bulkChecker.StartPosition       = [System.Windows.Forms.FormStartPosition]::CenterScreen

$APIKeyLabel                     = New-Object system.Windows.Forms.Label
$APIKeyLabel.text                = "API Key"
$APIKeyLabel.AutoSize            = $true
$APIKeyLabel.width               = 25
$APIKeyLabel.height              = 10
$APIKeyLabel.location            = New-Object System.Drawing.Point(28,140)
$APIKeyLabel.Font                = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$APIKeyLabel.ForeColor           = [System.Drawing.ColorTranslator]::FromHtml("#ECF0F1") # Light text color

$InputFilePathLabel              = New-Object system.Windows.Forms.Label
$InputFilePathLabel.text         = "CSV Input File Path / Name"
$InputFilePathLabel.AutoSize     = $true
$InputFilePathLabel.width        = 25
$InputFilePathLabel.height       = 10
$InputFilePathLabel.location     = New-Object System.Drawing.Point(25,196)
$InputFilePathLabel.Font         = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$InputFilePathLabel.ForeColor    = [System.Drawing.ColorTranslator]::FromHtml("#ECF0F1") # Light text color

$csvPathTextBox                  = New-Object system.Windows.Forms.TextBox
$csvPathTextBox.multiline        = $false
$csvPathTextBox.width            = 224
$csvPathTextBox.height           = 20
$csvPathTextBox.location         = New-Object System.Drawing.Point(22,221)
$csvPathTextBox.Font             = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$csvPathTextBox.BackColor        = [System.Drawing.ColorTranslator]::FromHtml("#34495E") # Darker background for textbox
$csvPathTextBox.ForeColor        = [System.Drawing.ColorTranslator]::FromHtml("#ECF0F1") # Light text color

$browseCsvPath                   = New-Object system.Windows.Forms.Button
$browseCsvPath.text              = "Browse"
$browseCsvPath.width             = 70
$browseCsvPath.height            = 30
$browseCsvPath.location          = New-Object System.Drawing.Point(263,216)
$browseCsvPath.Font              = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$browseCsvPath.BackColor         = [System.Drawing.ColorTranslator]::FromHtml("#3498DB") # Blue button
$browseCsvPath.ForeColor         = [System.Drawing.ColorTranslator]::FromHtml("#ECF0F1") # Light text color

$exportPathLabel                 = New-Object system.Windows.Forms.Label
$exportPathLabel.text            = "CSV Export File Path / Name"
$exportPathLabel.AutoSize        = $true
$exportPathLabel.width           = 25
$exportPathLabel.height          = 10
$exportPathLabel.location        = New-Object System.Drawing.Point(23,265)
$exportPathLabel.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$exportPathLabel.ForeColor       = [System.Drawing.ColorTranslator]::FromHtml("#ECF0F1") # Light text color

$exportPathTextBox               = New-Object system.Windows.Forms.TextBox
$exportPathTextBox.multiline     = $false
$exportPathTextBox.width         = 225
$exportPathTextBox.height        = 20
$exportPathTextBox.location      = New-Object System.Drawing.Point(23,287)
$exportPathTextBox.Font          = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$exportPathTextBox.BackColor     = [System.Drawing.ColorTranslator]::FromHtml("#34495E") # Darker background for textbox
$exportPathTextBox.ForeColor     = [System.Drawing.ColorTranslator]::FromHtml("#ECF0F1") # Light text color

$browseExportPath                = New-Object system.Windows.Forms.Button
$browseExportPath.text           = "Browse"
$browseExportPath.width          = 70
$browseExportPath.height         = 30
$browseExportPath.location       = New-Object System.Drawing.Point(263,282)
$browseExportPath.Font           = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$browseExportPath.BackColor      = [System.Drawing.ColorTranslator]::FromHtml("#3498DB") # Blue button
$browseExportPath.ForeColor      = [System.Drawing.ColorTranslator]::FromHtml("#ECF0F1") # Light text color

$AbuseIPDBLink                   = New-Object system.Windows.Forms.Button
$AbuseIPDBLink.text              = "No key? Click here"
$AbuseIPDBLink.width             = 160
$AbuseIPDBLink.height            = 36
$AbuseIPDBLink.location          = New-Object System.Drawing.Point(264,153)
$AbuseIPDBLink.Font              = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$AbuseIPDBLink.BackColor         = [System.Drawing.ColorTranslator]::FromHtml("#3498DB") # Blue button
$AbuseIPDBLink.ForeColor         = [System.Drawing.ColorTranslator]::FromHtml("#ECF0F1") # Light text color

$outputLabel                     = New-Object system.Windows.Forms.Label
$outputLabel.text                = "Output"
$outputLabel.AutoSize            = $true
$outputLabel.width               = 25
$outputLabel.height              = 10
$outputLabel.location            = New-Object System.Drawing.Point(163,399)
$outputLabel.Font                = New-Object System.Drawing.Font('Microsoft Sans Serif',16)
$outputLabel.ForeColor           = [System.Drawing.ColorTranslator]::FromHtml("#ECF0F1") # Light text color

$inputLabel                      = New-Object system.Windows.Forms.Label
$inputLabel.text                 = "Input"
$inputLabel.AutoSize             = $true
$inputLabel.width                = 25
$inputLabel.height               = 10
$inputLabel.location             = New-Object System.Drawing.Point(170,103)
$inputLabel.Font                 = New-Object System.Drawing.Font('Microsoft Sans Serif',16)
$inputLabel.ForeColor            = [System.Drawing.ColorTranslator]::FromHtml("#ECF0F1") # Light text color

$topTitle                        = New-Object system.Windows.Forms.Label
$topTitle.text                   = "AbuseIPDB Bulk Checker"
$topTitle.AutoSize               = $true
$topTitle.width                  = 25
$topTitle.height                 = 10
$topTitle.location               = New-Object System.Drawing.Point(78,51)
$topTitle.Font                   = New-Object System.Drawing.Font('Sylfaen',18,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$topTitle.ForeColor              = [System.Drawing.ColorTranslator]::FromHtml("#ECF0F1") # Light text color

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "the legend"
$Label1.AutoSize                 = $true
$Label1.width                    = 25
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(112,22)
$Label1.Font                     = New-Object System.Drawing.Font('Jokerman',12,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Italic))
$Label1.ForeColor                = [System.Drawing.ColorTranslator]::FromHtml("#E74C3C") # Red color

$ToolTip2                        = New-Object system.Windows.Forms.ToolTip
$ToolTip2.ToolTipTitle           = "Unleash the bulk check"
$ToolTip2.isBalloon              = $false

$outputBox                       = New-Object system.Windows.Forms.TextBox
$outputBox.multiline             = $true
$outputBox.width                 = 371
$outputBox.height                = 130
$outputBox.enabled               = $false
$outputBox.location              = New-Object System.Drawing.Point(8,518)
$outputBox.Font                  = New-Object System.Drawing.Font('Lucida Console',10)
$outputBox.BackColor             = [System.Drawing.ColorTranslator]::FromHtml("#34495E") # Darker background for textbox
$outputBox.ForeColor             = [System.Drawing.ColorTranslator]::FromHtml("#ECF0F1") # Light text color

$outputProgress                  = New-Object system.Windows.Forms.ProgressBar
$outputProgress.width            = 370
$outputProgress.height           = 30
$outputProgress.location         = New-Object System.Drawing.Point(10,448)

$Run                             = New-Object system.Windows.Forms.Button
$Run.text                        = "Run"
$Run.width                       = 116
$Run.height                      = 60
$Run.location                    = New-Object System.Drawing.Point(34,648)
$Run.Font                        = New-Object System.Drawing.Font('Microsoft Sans Serif',12)
$Run.BackColor                   = [System.Drawing.ColorTranslator]::FromHtml("#2ECC71") # Green button
$Run.ForeColor                   = [System.Drawing.ColorTranslator]::FromHtml("#ECF0F1") # Light text color

$Exit                            = New-Object system.Windows.Forms.Button
$Exit.text                       = "Run Away!"
$Exit.width                      = 116
$Exit.height                     = 60
$Exit.location                   = New-Object System.Drawing.Point(220,648)
$Exit.Font                       = New-Object System.Drawing.Font('Microsoft Sans Serif',12)
$Exit.BackColor                  = [System.Drawing.ColorTranslator]::FromHtml("#E74C3C") # Red button
$Exit.ForeColor                  = [System.Drawing.ColorTranslator]::FromHtml("#ECF0F1") # Light text color

$apiKeyTextBox                   = New-Object system.Windows.Forms.TextBox
$apiKeyTextBox.multiline         = $false
$apiKeyTextBox.width             = 225
$apiKeyTextBox.height            = 20
$apiKeyTextBox.location          = New-Object System.Drawing.Point(22,155)
$apiKeyTextBox.Font              = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$apiKeyTextBox.BackColor         = [System.Drawing.ColorTranslator]::FromHtml("#34495E") # Darker background for textbox
$apiKeyTextBox.ForeColor         = [System.Drawing.ColorTranslator]::FromHtml("#ECF0F1") # Light text color

$currentIPBox                    = New-Object system.Windows.Forms.TextBox
$currentIPBox.multiline          = $false
$currentIPBox.width              = 200
$currentIPBox.height             = 22
$currentIPBox.location           = New-Object System.Drawing.Point(92,487)
$currentIPBox.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
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
     $csvFileDialog.initialDirectory = $initialDirectoryry
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
    $global:exportPath = $exportPathTextBox.text
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
    Remove-Item $jsonTempPath.FullName -Force #Remove temp file       
}

[void]$bulkChecker.ShowDialog()
