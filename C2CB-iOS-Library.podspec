#
# Be sure to run `pod lib lint C2CB-iOS-Library.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'C2CB-iOS-Library'
  s.version          = '0.1.1'
  s.summary          = 'Context to Call is a very simple yet effective and flexible library to easily add Call, SMS or Email functionality'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Context to Call is a very simple yet effective and flexible library to easily add Call, SMS or Email buttons functionality to your app. This will allow visitors to get in touch with you with one simple touch.
                       DESC

  s.homepage         = 'https://github.com/TroyVGroup/C2CB-iOS-Library'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Satyam Kumar' => 'satyam.kumar@vgroup.net' }
  s.source           = { :git => 'https://github.com/TroyVGroup/C2CB-iOS-SDK-EmbeddedCode.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'
  s.swift_version = '5.0'
  s.source_files = 'C2CB-iOS-Library/Classes/**/*'
  
   #s.resource_bundles = {
    # 'C2CB-iOS-Library' => ['C2CB-iOS-Library/Assets/*.png']
   #}

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
#https://github.com/TroyVGroup/C2CB-iOS-SDK-EmbeddedCode
