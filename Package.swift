// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftMathExpression",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "SwiftMathExpression",
            targets: ["SwiftMathExpression"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SwiftMathExpression",
            dependencies: []),
        .testTarget(
            name: "SwiftMathExpressionTests",
            dependencies: ["SwiftMathExpression"]),
    ]
)
