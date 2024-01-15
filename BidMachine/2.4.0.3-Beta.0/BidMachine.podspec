Pod::Spec.new do |spec|
  spec.name                     = "BidMachine"
  spec.version                  = "2.4.0.3-Beta.0"
  spec.summary                  = "BidMachine iOS SDK"

  spec.homepage                 = "https://bidmachine.io"
  spec.license                  = { :type => 'Commercial', :text => 'https://bidmachine.io/sdk-license-agreement/' }
  spec.author                   = { "Stack" => "https://explorestack.com/bidmachine/" }

  spec.platform                 = :ios, '12.0'
  spec.swift_version            = "5.1"
  
  spec.pod_target_xcconfig = {
    "VALID_ARCHS": "arm64 x86_64",
    "VALID_ARCHS[sdk=iphoneos*]": "arm64",
    "VALID_ARCHS[sdk=iphonesimulator*]": "arm64 x86_64"
  }

  spec.source                   = { :http => "https://s3-us-west-1.amazonaws.com/appodeal-ios/#{spec.name}/#{spec.version}/#{spec.name}.zip" }

  spec.default_subspec = 'Core'

  spec.subspec 'Core' do |ss|
    ss.vendored_frameworks = 'BidMachine.xcframework' 
    ss.dependency 'BidMachine/ApiCore'
    ss.dependency 'BidMachine/BiddingCore'
    ss.dependency 'BidMachine/ModulesCore'
   end

   spec.subspec 'ApiCore' do |ss|
    ss.vendored_frameworks = 'BidMachineApiCore.xcframework' 
   end

   spec.subspec 'BiddingCore' do |ss|
    ss.vendored_frameworks = 'BidMachineBidding.xcframework' 
    ss.dependency 'BidMachine/ApiCore'
    ss.dependency 'StackIAB', '~> 2.4.0'
    ss.dependency 'StackModules', '~> 1.6.0'
   end

   spec.subspec 'ModulesCore' do |ss|
    ss.vendored_frameworks = 'BidMachineModules.xcframework'
    ss.dependency 'BidMachine/ApiCore'
   end

end
