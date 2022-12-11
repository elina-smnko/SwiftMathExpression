
Pod::Spec.new do |spec|

spec.name = 'SwiftMathExpression'
spec.version = 'v1.0.2'
spec.author = 'Elina S.'
spec.license = { :type => 'MIT', :file => 'LICENSE' }
spec.homepage = 'https://github.com/elina-smnko/SwiftMathExpression'
spec.source = { :git => 'https://github.com/elina-smnko/SwiftMathExpression.git', :tag => "v#{spec.version}" }
spec.summary = 'SwiftMathExpression is a Swift framework that provides an API to evaluate arithmetic expressions in String form'

spec.platform = :ios, '13'
spec.swift_version = '5'
spec.source_files = 'Sources/SwiftMathExpression/*'

end
