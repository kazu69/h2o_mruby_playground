FROM ubuntu

RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository -y ppa:brightbox/ruby-ng
RUN apt-get -y update
RUN apt-get install -y git ruby2.2 rake curl wget gcc make bison libssl-dev libcurl4-openssl-dev libpcre3 libpcre3-dev

WORKDIR /usr/local/src/

RUN git clone git://github.com/matsumoto-r/ngx_mruby.git

WORKDIR /usr/local/src/ngx_mruby

RUN cp -p build_config.rb build_config.rb.org
ADD conf/build_config.rb /usr/local/src/ngx_mruby/build_config.rb
ENV NGINX_CONFIG_OPT_ENV --with-http_ssl_module --prefix=/usr/local/nginx
RUN sh build.sh
RUN make install

# https://raw.githubusercontent.com/JasonGiedymin/nginx-init-ubuntu/master/nginx
ADD conf/initScript.sh /etc/init.d/
RUN mv /etc/init.d/initScript.sh /etc/init.d/nginx
RUN chmod +x /etc/init.d/nginx
RUN update-rc.d nginx defaults

WORKDIR /etc/

RUN mkdir -p nginx/ssl

WORKDIR /etc/nginx/ssl

RUN openssl genrsa -out server.key 2048 ; openssl req -new -key server.key -out server.csr -subj '/C=JP/ST=Tokyo/L=Tokyo/O=Example Ltd./OU=Web/CN=localhost' ; openssl x509 -in server.csr -days 3650 -req -signkey server.key > server.crt

ADD conf/nginx.conf /usr/local/nginx/conf/nginx.conf
ADD hook /usr/local/nginx/hook
ADD html /usr/local/nginx/html

EXPOSE 80 443

CMD service nginx start
