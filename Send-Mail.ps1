param(
    [Parameter(Mandatory=$true)]
    [string[]]$Attachments  # 接收右键选中的文件路径
)

# 邮件配置（修改以下参数！！！）
$EmailFrom = "dongluhao@qq.com"
$EmailTo = "luhao.dong@mdk.icbc.com.cn"
$Subject = "自动发送的文件"
$Body = "附件已送达，请查收。"
$SMTPPassword = "rfgztymsuzyrbhig"
$SMTPServer = "smtp.qq.com"
$SMTPPort = 587

# 发送邮件
$SecurePassword = ConvertTo-SecureString $SMTPPassword -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential ($EmailFrom, $SecurePassword)
Send-MailMessage -From $EmailFrom -To $EmailTo -Subject $Subject -Body $Body `
                 -Attachments $Attachments -SmtpServer $SMTPServer -Port $SMTPPort `
                 -Credential $Credential -UseSsl -Encoding UTF8