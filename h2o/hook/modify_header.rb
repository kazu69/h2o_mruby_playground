Proc.new do |env|
    push_paths = %w(
        /css/normalize.css
        /css/main.css
        /js/modernizr-2.8.3.min.js
        /js/jquery-1.12.0.min.js
        /js/plugins.js
        /js/main.js
    )
    [399, push_paths.empty? ? {} : {"link" => push_paths.map{|p| "<#{p}>; rel=preload"}.join("\n")}, []]
end