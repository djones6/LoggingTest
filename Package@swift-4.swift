// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "Test",
    dependencies: [
        .package(url: "https://github.com/djones6/Kitura.git", .branch("swift-log")),
        .package(url: "https://github.com/djones6/LoggerAPI.git", .branch("swift-log")),
        .package(url: "https://github.com/apple/swift-log.git", .upToNextMinor(from: "0.0.0")),
    ],
    targets: [
        .target(
            name: "Test",
            dependencies: ["Kitura", /*"LoggerAPI",*/ "Logging"]),
        .testTarget(
            name: "TestTests",
            dependencies: ["Test"]),
    ]
)
