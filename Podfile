#source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '13.0'

inhibit_all_warnings!
use_frameworks!

workspace 'ComponentsUIWorkspace'

target 'ComponentsUI' do

  pod 'UIView+Shimmer'

  target 'ComponentsUITests' do

    pod 'SnapshotTesting'
    
  end

end

target 'Sandbox' do

  project 'Sandbox/Sandbox'

  pod 'ComponentsUI', :path => './'

end