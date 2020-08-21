Pod::Spec.new do |s|
s.name         = 'ZXAgreementLabel'
s.version      = '1.0.3'
s.summary      = '【基于YYText】，超简单！一行代码实现点击同意协议Label'
s.homepage     = 'https://github.com/SmileZXLee/ZXAgreementLabel'
s.license      = 'MIT'
s.authors      = {'李兆祥' => '393727164@qq.com'}
s.platform     = :ios, '8.0'
s.source       = {:git => 'https://github.com/SmileZXLee/ZXAgreementLabel.git', :tag => s.version}
s.source_files = 'ZXAgreementLabel/**/*.{h,m}'
s.resource     = 'ZXAgreementLabel/ZXAgreementLabel.bundle'
s.requires_arc = true
s.dependency 'YYText'
end