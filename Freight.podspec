Pod::Spec.new do |s|
  s.name         = 'Freight'
  s.version      = '0.1.0'
  s.summary      = 'Freight'
  s.description  = <<-DESC
                   Freight
                   DESC
  s.homepage     = 'https://github.com/SwiftFreight/Freight'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'jasonnam' => 'contact@jasonnam.com' }

  s.source       = { :path => '.' }

  s.subspec 'Core' do |sp|
    sp.source_files = 'Sources/Freight/**/*.{swift}'
  end
  s.subspec 'Realm' do |sp|
    sp.source_files = [
      'Sources/RealmFreight/**/*.{swift}',
      'DevelopmentPods/FreightUnitTests/Sources/RealmFreightUnitTests/**/*.{swift}'
    ]
    sp.dependency 'Freight/Core'
    sp.dependency 'RealmSwift'
  end
  s.subspec 'UserDefaults' do |sp|
    sp.source_files = [
      'Sources/UserDefaultsFreight/**/*.{swift}',
      'DevelopmentPods/FreightUnitTests/Sources/UserDefaultsFreightUnitTests/**/*.{swift}'
    ]
    sp.dependency 'Freight/Core'
  end
  s.subspec 'CloudKit' do |sp|
    sp.source_files = 'Sources/CloudKitFreight/**/*.{swift}'
    sp.dependency 'Freight/Core'
  end
end
