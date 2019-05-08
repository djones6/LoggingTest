// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Test",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/IBM-Swift/Kitura.git", from: "2.7.0"),
        .package(url: "https://github.com/IBM-Swift/LoggerAPI.git", from: "1.8.0"),
        .package(url: "https://github.com/IBM-Swift/HeliumLogger.git", from: "1.8.0"),
        .package(url: "https://github.com/apple/swift-log.git", .upToNextMinor(from: "0.0.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Test",
            dependencies: ["Kitura", "LoggerAPI", "HeliumLogger", "Logging"]),
        .testTarget(
            name: "TestTests",
            dependencies: ["Test"]),
    ]
)