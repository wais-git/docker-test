cd "C:\Users\jfahey-gilmour\OneDrive - WESTERN AUSTRALIAN INSTITUTE OF SPORT INCORPORATED\Documents\GitHub\docker-test"

#docker images

# Build image
docker build -t  waisdatascience/docker-test .
#docker push waisdatascience/docker-test:latest

#New-StoredCredential -Target "Power BI Login" -UserName "jfahey-gilmour@wais.org.au" -Password "insert pwd"
$ams_pwd_encrypt = Get-StoredCredential -Target "System AMS Credentials"
$db_pwd_encrypt = Get-StoredCredential -Target "Azure Database Creds"

$ams_pwd = (New-Object PSCredential $ams_pwd_encrypt).GetNetworkCredential().Password
$db_pwd = (New-Object PSCredential $db_pwd_encrypt).GetNetworkCredential().Password

# Cant mount full directory as renv doesnt like being mounted into the container, tries to rebuild with linux?
# have to use full extension, doesn't understand relative directories
# >> ... is to a log file with 2>&1 to ensure standard error (stderr) gets routed to standard output (stdout) this is an issue with R, error output vs standard text output (https://www.scalyr.com/blog/how-to-redirect-docker-logs-to-a-single-file)
# > vs >> in log file, << appends data, > overwrites file

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

#docker run -v "C:\Users\jfahey-gilmour\OneDrive - WESTERN AUSTRALIAN INSTITUTE OF SPORT INCORPORATED\Documents\GitHub\docker-test:/project_directory" -w /project_directory -v "C:/Users/jfahey-gilmour/WESTERN AUSTRALIAN INSTITUTE OF SPORT INCORPORATED/WAIS DMS - Competitions:/project_directory/WAIS DMS - Competitions" -e TZ=Australia/Perth -e ams_username='wais.datascience' -e ams_pwd=$ams_pwd -e db_username='project_results@wais.org.au' -e db_pwd=$db_pwd waisdatascience/docker-test

#docker run -v "C:\Users\jfahey-gilmour\OneDrive - WESTERN AUSTRALIAN INSTITUTE OF SPORT INCORPORATED\Documents\GitHub\docker-test\Data:/Data" -e TZ=Australia/Perth -e ams_username='wais.datascience' -e ams_pwd=$ams_pwd -e db_username='project_results@wais.org.au' -e db_pwd=$db_pwd waisdatascience/docker-test


# Run container from image - this works
#docker run -v "C:\Users\jfahey-gilmour\OneDrive - WESTERN AUSTRALIAN INSTITUTE OF SPORT INCORPORATED\Documents\GitHub\docker-test\Data:/Data" -e TZ=Australia/Perth -e ams_username='wais.datascience' -e ams_pwd=$ams_pwd -e db_username='project_results@wais.org.au' -e db_pwd=$db_pwd waisdatascience/docker-test


#-w /myfiles
#docker run -v ~/Data:/Data waisdatascience/docker-test


# How to run docker image as container thats not local? pull image from docker hub and then execute?