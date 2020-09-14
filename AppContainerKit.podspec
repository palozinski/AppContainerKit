Pod::Spec.new do |s|

  s.name         = "AppContainerKit"
  s.version      = "0.1.3"
  s.summary      = "Separated storyboards configuration as convinient to use container"
  s.description  = <<-DESC
  Separated storyboards configuration for support two state of Application like Authorization flow and Main
                   DESC

  s.homepage     = "https://twitter.com/p_mozliwy"
  s.license      = "MIT"
  s.author       = { "Łoziński Paweł" => "palozinski@gmail.com" }
  s.platform     = :ios, "12.0"

  s.source       = { :git => "https://github.com/palozinski/AppContainerKit.git", :tag => "#{s.version}" }
  s.source_files  = ["AppContainerKit/Sources/**/*"]
  # s.resources = ["AppContainerKit/Storyboards/**/*.storyboard"]
  s.swift_version = "5.0"
end
