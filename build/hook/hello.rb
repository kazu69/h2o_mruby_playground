r = H2O::Request.new

ua = r.headers_in["User-Agent"].to_s
new_ua = r.headers_in["User-Agent"] = "new-#{ua}-h2o_mruby"
uri = r.uri
host = r.hostname
method = r.method
query = r.query

msg = "User-Agent:#{ua}\nNew User-Agent:#{new_ua}\npath:#{uri}\nhost:#{host}\nmethod:#{method}\nquery:#{query}\nremote_ip:#{H2O::Connection.new.remote_ip}"

r.log_error msg

H2O.return 200, "OK", msg + "\n"
