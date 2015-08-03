FROM ubuntu

RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository -y ppa:brightbox/ruby-ng
RUN apt-get -y update
RUN apt-get install -y git ruby2.2 rake curl wget gcc make bison libssl-dev libcurl4-openssl-dev libpcre3 libpcre3-dev cmake build-essential libyaml-dev automake python-geoip

WORKDIR /usr/local/src/

RUN git clone https://github.com/mruby/mruby.git
WORKDIR /usr/local/src/mruby
RUN mv build_config.rb build_config.rb.org
ADD conf/build_config.rb /usr/local/src/mruby/build_config.rb
RUN make
RUN cp build/host/lib/libmruby.a build/host/lib/libmruby_core.a /usr/lib/.
RUN cp -r include/* /usr/include/.

WORKDIR /usr/local/src/

RUN git clone git://github.com/h2o/h2o.git

WORKDIR /usr/local/src/h2o/

RUN cmake -DWITH_MRUBY=ON -DCMAKE_INSTALL_PREFIX=/usr/local .
RUN make
RUN make install

RUN mkdir -p /usr/local/h2o/conf
RUN cp examples/h2o/h2o.conf /usr/local/h2o/conf/

WORKDIR /etc/h2o/ssl/

RUN openssl genrsa -out server.key 2048 ; openssl req -new -key server.key -out server.csr -subj '/C=JP/ST=Tokyo/L=Tokyo/O=Example Ltd./OU=Web/CN=localhost' ; openssl x509 -in server.csr -days 3650 -req -signkey server.key > server.crt

ONBUILD ADD conf/h2o.conf /usr/local/h2o/conf/h2o.conf

CMD ['/usr/local/bin/h2o', '-c', '/usr/local/h2o/conf/h2o.conf']
