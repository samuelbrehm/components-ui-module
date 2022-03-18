Pod::Spec.new do |spec|

    spec.name = 'ComponentsUI'
    spec.version = '0.1.0'
    spec.summary = 'Components to be used in the App.'
    spec.homepage = 'https://github.com/samuelbrehm/components-ui-module'
    spec.author = { 'Samuel Brehm' => "samuelbrehm@gmail.com" }
    spec.license = { :type => 'public' }
    spec.source = { :git => 'https://github.com/samuelbrehm/components-ui-module.git', 
                    :tag => spec.version.to_s }
  
    spec.ios.deployment_target = '13.0'
    spec.requires_arc = true
  
    spec.cocoapods_version = '>= 1.5'
    spec.swift_version = '5.5'
  
    spec.source_files = 'ComponentsUI/**/*.{h,m,swift}'
  
    spec.resource_bundles = {
      'ComponentsUI' => [
        'ComponentsUI/**/*.xcassets',
        'ComponentsUI/**/*.xib'
      ]
    }
  
    spec.dependency 'UIView+Shimmer'
  
  end