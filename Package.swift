// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WWNetWorkMonitor",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: "WWNetWorkMonitor", targets: ["WWNetWorkMonitor"]),
    ],
    targets: [
        .target(name: "WWNetWorkMonitor", resources: [.copy("Privacy")]),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
