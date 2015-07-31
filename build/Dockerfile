FROM h2o_mruby:base

ADD hook /usr/local/h2o/hook
ADD html /usr/local/h2o/html

EXPOSE 80 443

CMD /usr/local/bin/h2o -c /usr/local/h2o/conf/h2o.conf
