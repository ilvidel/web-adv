#!/bin/sh
# deploy.sh
set -e

sudo apt-get install -y lftp

# deployment via ftp upload. Using FTPS for that
lftp -c "set ssl:verify-certificate false; open ftp://$FTP_USER:$FTP_PASS@$FTP_HOST:21; mirror -Rv /home/nacho/repos/web-adv/public/ /www.advmiguelturra.org/; quit;"
lftp -c "set ssl:verify-certificate false; open ftp://$FTP_USER:$FTP_PASS@$FTP_HOST:21; mirror -Rv /home/nacho/repos/web-adv/vplaya/ /www.advmiguelturra.org/vplaya; quit;"
