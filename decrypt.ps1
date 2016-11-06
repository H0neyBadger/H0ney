
# read User Key
$userDesk = [Environment]::GetFolderPath("Desktop")
$key = Get-Content "$userDesk/H0ney.key" -Encoding byte

# create ps AES objects
# sources
# http://indogeeks.com/how-to-use-aes-encryption-in-powershell/
# https://gist.github.com/ctigeek/2a56648b923d198a6e60
$AES = New-Object System.Security.Cryptography.AesManaged
Write-Host "AES Key: $key"
$AES.Key = $key
$AES.Padding = [System.Security.Cryptography.PaddingMode]::Zeros

# ls list all files ending by .enc
Get-ChildItem .\*.enc | ForEach-Object {
    $bytes = Get-Content "$($_.FullName)" -Encoding byte
    $oriname = "$($_.FullName)" -replace '\.enc$','' 
    # retrieve IV trom 16 first bytes
    $iv = $bytes[0..15]
    $AES.iv = $iv
    Write-Host "IV: $iv"
    $decryptor = $AES.CreateDecryptor()
    $unencryptedData = $decryptor.TransformFinalBlock($bytes, 16, $bytes.Length - 16)
    Set-Content -Value $unencryptedData -LiteralPath $oriname -Encoding byte
    Write-Host (Get-Content $oriname)
}