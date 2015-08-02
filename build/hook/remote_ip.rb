remote_ip = H2O::Connection.new.remote_ip

H2O.return 200, 'OK', remote_ip
