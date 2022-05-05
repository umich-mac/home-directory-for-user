// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "homedir-for-user",
    platforms: [
        .macOS(.v10_14)
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", .upToNextMajor(from: "1.0.2")),
    ],
    targets: [
        .executableTarget(
            name: "homedir-for-user",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ])
    ]
)
