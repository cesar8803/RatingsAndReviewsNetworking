source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

def shared_pods
    pod 'Alamofire', '~> 4.7.3'
    pod 'AlamofireObjectMapper', '~> 5.2'
end

target 'RatingsAndReviewsNetworking' do
  shared_pods
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.2'
    end
  end
end
