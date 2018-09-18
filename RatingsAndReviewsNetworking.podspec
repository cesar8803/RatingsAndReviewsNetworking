Pod::Spec.new do |s|
s.name         = "RatingsAndReviewsNetworking"
s.swift_version = '3.2'
s.version      = "1.0.0"
s.summary      = "Pod para el apoyo de consultas a servicio de Ratings and Review"

s.description  = "Pod de ayuda para consultar, crear y enviar información a servicio en cargado del modulo de Ratings and Reviews, el cual será utilizado por las dos grandes aplicacione sde Liverpool, ShoppingApp y SellerApp"

s.homepage     = "https://www.liverpool.com.mx"
# s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

#s.license      = "MIT"
s.license      = { :type => "MIT", :file => "LICENSE" }

s.author             = { "JJMaqueda" => "jjmaquedaf@liverpool.com.mx" }
# Or just: s.author    = "JJMaqueda"
# s.authors            = { "JJMaqueda" => "jjmaquedaf@liverpool.com.mx" }

# s.platform     = :ios
s.platform     = :ios, "9.0"

#  When using multiple platforms
s.ios.deployment_target = "9.0"
# s.osx.deployment_target = "10.7"
# s.watchos.deployment_target = "2.0"
# s.tvos.deployment_target = "9.0"

s.source       = { :git => "https://github.com/cesar8803/RatingsAndReviewsNetworking.git", :tag => "#{s.version}" }

s.source_files = "RatingsAndReviewsNetworking/**/*"
#s.source_files  = "Classes", "Classes/**/*.{h,m}"
#s.exclude_files = "Classes/Exclude"

# s.public_header_files = "Classes/**/*.h"

s.framework  = "Foundation"
# s.frameworks = "SomeFramework", "AnotherFramework"

# s.library   = "iconv"
# s.libraries = "iconv", "xml2"

# ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
#
#  If your library depends on compiler flags you can set them in the xcconfig hash
#  where they will only apply to your library. If you depend on other Podspecs
#  you can include multiple dependencies to ensure it works.

s.requires_arc = true

# s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
s.dependency "Alamofire", "~> 4.7.3"
s.dependency "AlamofireObjectMapper", "~> 5.1.0"

end

