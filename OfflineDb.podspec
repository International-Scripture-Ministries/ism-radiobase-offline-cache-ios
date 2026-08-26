require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name = 'OfflineDb'
  s.version = package['version']
  s.summary = package['description']
  s.license = package['license']
  s.homepage = package['repository']['url']
  s.author = package['author']
  s.source = { :git => package['repository']['url'], :tag => s.version.to_s }
  s.source_files = 'ios/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'
  s.resources = 'ios/Plugin/Source/Resources/DB/default.realm'
  s.ios.deployment_target  = '15.0'
  s.dependency 'Capacitor'
  s.dependency 'RealmSwift', '~>10'
  s.dependency 'ObjectMapper'
  s.swift_version = '5.1'
end
