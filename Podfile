source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.1'
use_frameworks!

def shared_pods
    pod 'Alamofire', '~> 4.0'
    pod 'AlamofireObjectMapper', '~> 4.0'
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
