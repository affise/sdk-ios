#
# Be sure to run `pod lib lint AffiseModule.podspec` to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name         = "AffiseModule"
  s.version      = ENV["LIB_VERSION"] || "1.6.19"
  s.summary      = "Affise Modules"
  s.description  = "Affise module collection"
  s.homepage     = "https://github.com/affise/sdk-ios"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Affise" => "support@affise.com" }
  s.source       = {
     :git => "https://github.com/affise/sdk-ios.git", 
     :tag => "#{s.version}", 
     :submodules => true
  }

  s.ios.deployment_target = "9.0"
  s.swift_version = "5.7"

  s.dependency "AffiseAttributionLib"
  
  s.subspec "Status" do |sub|
    sub.source_files = "AffiseModule/Status/Classes/**/*.{swift}"
  end
  
  s.subspec "Advertising" do |sub|
    sub.source_files = "AffiseModule/Advertising/Classes/**/*.{swift}"
  end
end
