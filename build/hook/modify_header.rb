r = H2O::Request.new

ua = r.headers_in['User-Agent'].to_s

result = case ua.downcase
when /chrome/
    'Chrome'
when /safari/
    'Safari'
when /firefox/
    'Firefox'
when /msie/
    'MSIE'
else
    'Other'
end

r.headers_out["X-UserAgent"] = result

H2O.return H2O::DECLINED
