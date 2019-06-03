# fix ERROR: cannot verify github.com's certificate, issued by ‘CN=DigiCert SHA2 Extended Validation Server CA,OU=www.digicert.com,O=DigiCert Inc,C=US’:
# edit line 15-16 of /usr/local/bin/c_rehash to read:
# my $dir = "/usr/local/ssl";
# my $prefix = "/usr/local/ssl";
# cd /usr/local/ssl/certs
# sudo cp /etc/ssl/certs/* ./

# https://wiki.mozilla.org/Security/Server_Side_TLS#Modern_compatibility


apt install gcc make

cd /home/setup


wget https://www.openssl.org/source/openssl-1.1.1a.tar.gz
tar -zxf openssl-1.1.1a.tar.gz && cd openssl-1.1.1a
./config
make
sudo make install
sudo mv /usr/bin/openssl ~/tmp
sudo ln -s /usr/local/bin/openssl /usr/bin/openssl
sudo ldconfig
openssl version


wget https://github.com/simpl/ngx_devel_kit/archive/v0.3.0.tar.gz --no-check-certificate
tar -xzvf v0.3.0.tar.gz
wget https://github.com/openresty/set-misc-nginx-module/archive/v0.31.tar.gz --no-check-certificate
tar -xzvf v0.31.tar.gz


wget http://nginx.org/download/nginx-1.15.8.tar.gz
tar -zxf nginx-1.15.8.tar.gz && cd nginx-1.15.8

./configure --prefix=/usr/local/nginx-1.15.8	\
		--with-http_ssl_module			\
		--with-http_v2_module			\
		--with-http_geoip_module		\
		--with-http_gunzip_module		\
		--with-http_auth_request_module		\
		--with-openssl=/home/setup/openssl-1.1.1a \
        --with-http_sub_module \
        --add-module=/home/setup/ngx_devel_kit-0.3.0  \
        --add-module=/home/setup/set-misc-nginx-module-0.31
