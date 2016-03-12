hin = Nginx::Headers_in.new
hac = hin['Accept'].find { |h| h.include? 'text/html' }
if !hac.nil?
  hout = Nginx::Headers_out.new
  paths = %w(
      /css/normalize.css
      /css/main.css
      /js/modernizr-2.8.3.min.js
      /js/jquery-1.12.0.min.js
      /js/plugins.js
      /js/main.js
  )
  hout['Link'] = paths.map{ |p| "<#{p}>; rel=preload" }
end
