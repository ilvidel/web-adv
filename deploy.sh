#!/bin/sh
# deploy.sh

echo "Installing lftp..."
sudo apt-get install -y lftp

# deployment via ftp upload. Using FTPS for that
echo "Uploading images..."
lftp -c "set ftp:passive-mode true; set ssl:verify-certificate false; open ftp://$FTP_USER:$FTP_PASS@$FTP_HOST:21; mirror --parallel=10 -Rv --only-missing --ignore-time public/img/ /www.advmiguelturra.org/; quit;"

echo "Updating the main website..."
lftp -c "set ftp:passive-mode true; set ssl:verify-certificate false; open ftp://$FTP_USER:$FTP_PASS@$FTP_HOST:21; mirror --parallel=10 -Rv --ignore-time public/blog/ /www.advmiguelturra.org/; quit;"
lftp -c "set ftp:passive-mode true; set ssl:verify-certificate false; open ftp://$FTP_USER:$FTP_PASS@$FTP_HOST:21; mirror --parallel=10 -Rv --ignore-time public/categories/ /www.advmiguelturra.org/; quit;"
lftp -c "set ftp:passive-mode true; set ssl:verify-certificate false; open ftp://$FTP_USER:$FTP_PASS@$FTP_HOST:21; mirror --parallel=10 -Rv --ignore-time public/css/ /www.advmiguelturra.org/; quit;"
lftp -c "set ftp:passive-mode true; set ssl:verify-certificate false; open ftp://$FTP_USER:$FTP_PASS@$FTP_HOST:21; mirror --parallel=10 -Rv --ignore-time public/js/ /www.advmiguelturra.org/; quit;"
lftp -c "set ftp:passive-mode true; set ssl:verify-certificate false; open ftp://$FTP_USER:$FTP_PASS@$FTP_HOST:21; mirror --parallel=10 -Rv --ignore-time public/page/ /www.advmiguelturra.org/; quit;"
lftp -c "set ftp:passive-mode true; set ssl:verify-certificate false; open ftp://$FTP_USER:$FTP_PASS@$FTP_HOST:21; mirror --parallel=10 -Rv --ignore-time public/tags/ /www.advmiguelturra.org/; quit;"
lftp -c "set ftp:passive-mode true; set ssl:verify-certificate false; open ftp://$FTP_USER:$FTP_PASS@$FTP_HOST:21; mirror --parallel=10 -Rv --ignore-time public/404.html /www.advmiguelturra.org/; quit;"
lftp -c "set ftp:passive-mode true; set ssl:verify-certificate false; open ftp://$FTP_USER:$FTP_PASS@$FTP_HOST:21; mirror --parallel=10 -Rv --ignore-time public/index.html /www.advmiguelturra.org/; quit;"
lftp -c "set ftp:passive-mode true; set ssl:verify-certificate false; open ftp://$FTP_USER:$FTP_PASS@$FTP_HOST:21; mirror --parallel=10 -Rv --ignore-time public/index.xml /www.advmiguelturra.org/; quit;"
lftp -c "set ftp:passive-mode true; set ssl:verify-certificate false; open ftp://$FTP_USER:$FTP_PASS@$FTP_HOST:21; mirror --parallel=10 -Rv --ignore-time public/sitemap.xml /www.advmiguelturra.org/; quit;"

echo "Updating the vplaya section..."
lftp -c "set ftp:passive-mode true; set ssl:verify-certificate false; open ftp://$FTP_USER:$FTP_PASS@$FTP_HOST:21; mirror --parallel=10 -Rv --only-missing --ignore-time vplaya/ /www.advmiguelturra.org/vplaya; quit;"
