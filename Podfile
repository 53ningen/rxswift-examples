# Uncomment this line to define a global platform for your project
platform :ios, '8.0'
use_frameworks!

def install_pods
    pod 'RxSwift', '2.0.0-beta.3'
    pod 'RxCocoa', '2.0.0-beta.3'
end


target 'rxswift-examples' do
    install_pods
end

target 'rxswift-examplesTests' do
    install_pods
    pod 'Quick', '0.8.0'
    pod 'Nimble', '3.0.0'
    pod 'RxBlocking', '2.0.0-beta.3'
end
