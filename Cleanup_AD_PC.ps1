# Finds computers that haven't been logged into in a year, then pings each of those machines once and outputs the result to a text file. #
$datecutoff = (Get-Date).AddDays(365)
Get-ADComputer -Properties LastLogonDate -Filter {LastLogonDate -ge $datecutoff} | FT Name >Computers.txt
Pause
Test-Connection -computername (Get-Content Computers.txt) >C:\pinged.txt -Count 1
Pause
