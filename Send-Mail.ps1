param(
    [Parameter(Mandatory=$true)]
    [string[]]$Attachments  # �����Ҽ�ѡ�е��ļ�·��
)

# �ʼ����ã��޸����²�����������
$EmailFrom = "dongluhao@qq.com"
$EmailTo = "luhao.dong@mdk.icbc.com.cn"
$Subject = "�Զ����͵��ļ�"
$Body = "�������ʹ����ա�"
$SMTPPassword = "rfgztymsuzyrbhig"
$SMTPServer = "smtp.qq.com"
$SMTPPort = 587

# �����ʼ�
$SecurePassword = ConvertTo-SecureString $SMTPPassword -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential ($EmailFrom, $SecurePassword)
Send-MailMessage -From $EmailFrom -To $EmailTo -Subject $Subject -Body $Body `
                 -Attachments $Attachments -SmtpServer $SMTPServer -Port $SMTPPort `
                 -Credential $Credential -UseSsl -Encoding UTF8