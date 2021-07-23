docker pull waisdatascience/docker-test

$ams_pwd_encrypt = Get-StoredCredential -Target "System AMS Credentials"
$db_pwd_encrypt = Get-StoredCredential -Target "Azure Database Creds"

$ams_pwd = (New-Object PSCredential $ams_pwd_encrypt).GetNetworkCredential().Password
$db_pwd = (New-Object PSCredential $db_pwd_encrypt).GetNetworkCredential().Password

docker run `
-v "C:\Users\jfahey-gilmour\OneDrive - WESTERN AUSTRALIAN INSTITUTE OF SPORT INCORPORATED\Documents\GitHub\docker-test\Data:/Data" `
-v "C:\Users\jfahey-gilmour\OneDrive - WESTERN AUSTRALIAN INSTITUTE OF SPORT INCORPORATED\Documents\GitHub\docker-test\Scripts:/Scripts" `
-v "C:\Users\jfahey-gilmour\OneDrive - WESTERN AUSTRALIAN INSTITUTE OF SPORT INCORPORATED\Documents\GitHub\docker-test\neon:/neon" `
-v "C:/Users/jfahey-gilmour/WESTERN AUSTRALIAN INSTITUTE OF SPORT INCORPORATED/WAIS DMS - Competitions:/WAIS DMS - Competitions" `
-e ams_username='wais.datascience' `
-e ams_pwd=$ams_pwd `
-e db_username='project_results@wais.org.au' `
-e db_pwd=$db_pwd `
waisdatascience/docker-test  >> "C:\Users\jfahey-gilmour\OneDrive - WESTERN AUSTRALIAN INSTITUTE OF SPORT INCORPORATED\Documents\GitHub\docker-test\Scripts\docker_test.log" 2>&1

