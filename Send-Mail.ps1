# 定义脚本参数（强制要求传入附件路径）
param(
    [Parameter(Mandatory=$true)]  # 标记参数为必填项
    [string[]]$Attachments        # 接收多个文件路径（数组类型）
)

# ====================== 邮件服务器配置 ======================
$EmailFrom = "xxx@qq.com"       # 发件人QQ邮箱（需开启SMTP服务）
$EmailTo = "xxx@qq.com"  # 收件人邮箱
$Subject = "自动发送的文件"              # 邮件主题
$Body = "附件已送达，请查收。"           # 邮件正文内容
$SMTPPassword = "xxx"    # QQ邮箱授权码（非登录密码）
$SMTPServer = "smtp.qq.com"           # QQ邮箱SMTP服务器地址
$SMTPPort = 587                       # 使用TLS加密的端口

# ====================== 发送邮件逻辑 ======================
# 将明文密码转换为安全字符串
$SecurePassword = ConvertTo-SecureString $SMTPPassword -AsPlainText -Force

# 创建SMTP认证凭据
$Credential = New-Object System.Management.Automation.PSCredential ($EmailFrom, $SecurePassword)

# 调用邮件发送命令
Send-MailMessage -From $EmailFrom -To $EmailTo -Subject $Subject -Body $Body `
                 -Attachments $Attachments    # 传入附件路径列表
                 -SmtpServer $SMTPServer -Port $SMTPPort `
                 -Credential $Credential -UseSsl -Encoding UTF8
