// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RestSet",
    products: [
        .library(
            name: "RestSet",
            targets: ["RestSet"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "RestSet",
            dependencies: []),
        .testTarget(
            name: "RestSetTests",
            dependencies: ["RestSet"]),
    ]
)
