#!/bin/sh
# deploy.sh

echo "Installing lftp..."
sudo apt-get install -y lftp

# deployment via ftp upload. Using FTPS for that
echo "Updating the main website..."
lftp -c "set ssl:verify-certificate false; open ftp://$FTP_USER:$FTP_PASS@$FTP_HOST:21; mirror -Rv public/ /www.advmiguelturra.org/; quit;"
echo "Updating the vplaya section..."
lftp -c "set ssl:verify-certificate false; open ftp://$FTP_USER:$FTP_PASS@$FTP_HOST:21; mirror -Rv vplaya/ /www.advmiguelturra.org/vplaya; quit;"
