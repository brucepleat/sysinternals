@Echo Off

Echo Updating SysInternals files (may take a few seconds)
Echo Started at %Time%

rd /s/q "%temp%\sysinternals" >Nul: 2>Nul:
Curl -s -o "%temp%\SysinternalsSuite.zip" "https://download.sysinternals.com/files/SysinternalsSuite.zip"
md "%temp%\sysinternals"
powershell.exe -nologo -noprofile -command "& { Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::ExtractToDirectory('%temp%\SysinternalsSuite.zip', '%temp%\sysinternals'); }"
move /y "%temp%\sysinternals\*" "%Utils%" >Nul:
rd "%temp%\sysinternals"

Echo Ended at %Time%

