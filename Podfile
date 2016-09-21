# Uncomment this line to define a global platform for your project
platform :ios, '8.0'

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
      config.build_settings['MACOSX_DEPLOYMENT_TARGET'] = '10.10'
    end
  end
end

target 'rxswift-examples' do
  use_frameworks!

  # Pods for rxswift-examples
  pod 'RxSwift','3.0.0-beta.1'
  pod 'RxCocoa', '3.0.0-beta.1'


  target 'rxswift-examplesTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'Quick', :git => 'git@github.com:Quick/Quick.git', :branch => 'swift-3.0'
    pod 'Nimble', '5.0.0'
    pod 'RxBlocking', '3.0.0-beta.1'
  end

end

