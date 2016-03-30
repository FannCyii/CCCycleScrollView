d::Spec.new do |s|
s.name = 'CCCycleScrollView'
s.version = '1.1.0'
s.license = 'MIT'
s.summary = 'An cycle play image view on iOS.'
s.homepage = 'https://github.com/dsxNiubility/SXWaveAnimate'
s.authors = { 'Kivan' => '954713025@qq.com' }
s.source = { :git => 'https://github.com/FannCyii/CCCycleScrollView.git', :tag => s.version.to_s }
s.requires_arc = true
s.ios.deployment_target = '8.0'
s.source_files = 'CCCycleScrollView/*.{h,m}'
s.resources = '/images/*.{png,xib}'
end
