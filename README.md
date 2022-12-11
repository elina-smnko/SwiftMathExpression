# SwiftMathExpression

SwiftMathExpression is a Swift framework that provides an API to evaluate arithmetic expressions in String form.

## Installation
You may install the framework through dependency managers.

### Using CocoaPods
To use CocoaPods, first make sure you have installed it and updated it to the latest version by following their instructions on [cocoapods.org](https://cocoapods.org). Then, you should complete the following steps

1. Add SwiftMathExpression to your `Podfile`:

```ruby
pod 'SwiftMathExpression'
```

2. Update your pod sources and install the new pod by executing the following command in command line:

```
$ pod install --repo-update
```

### Using Swift Package Manager

To install using Swift Package Manager, add this to the `dependencies` section in your `Package.swift` file:

```swift
.package(url: "https://github.com/elina-smnko/SwiftMathExpression.git",
```
## Usage

After installing the framework, you can import the module by adding the following line in the "header" of any of your swift files:
```swift
import SwiftMathExpression
```

Then, you may initialise an instance of `MathExpression`:
```swift
let expression = MathExpression("1 + 2 * 2")
```
Please be aware that tokens (numbers and operators) should be separated by whitespaces. Other formats will result in errors.

To validate the expressions and work with them you should use the instance of  `MathService`.
It gives you an opportunity to add and evaluate expressions.
```swift
let service = MathService()
service.evaluate(expression: "2 * 2 / 4")
```

You should also use `MathServiceDelegate` to obtain the results of your computations.
```swift
func mathService(_ service: MathService, didFinishEvaluatingExpression expression: MathExpression, withResult result: Double)
```

## License

[MIT](https://choosealicense.com/licenses/mit/)
