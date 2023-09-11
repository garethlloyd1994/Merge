// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "Merge",
    platforms: [
        .iOS(.v13),
        .macOS(.v11),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "Merge",
            targets: ["Merge"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-async-algorithms", branch: "main"),
        .package(url: "https://github.com/vmanot/Swallow.git", branch: "master"),
        .package(url: "https://github.com/garethlloyd1994/SwiftUIX.git", branch: "master"),
    ],
    targets: [
        .target(
            name: "Merge",
            dependencies: [
                .product(name: "AsyncAlgorithms", package: "swift-async-algorithms"),
                "Swallow",
                "SwiftUIX"
            ],
            path: "Sources",
            swiftSettings: []
        ),
        .testTarget(
            name: "MergeTests",
            dependencies: [
                "Merge"
            ],
            path: "Tests"
        )
    ]
)
