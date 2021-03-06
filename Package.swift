// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Totp",
    platforms: [
      .macOS(.v10_12), .iOS(.v9), .tvOS(.v9)
    ],
    products: [
    .library(
      name: "TotpCore",
      targets: ["TotpCore"]
    )
  ],
    dependencies: [
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", .upToNextMinor(from: "0.8.0")),
        .package(url: "https://github.com/norio-nomura/Base32.git", .upToNextMinor(from: "0.6.0")),

    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "TotpCore",
            dependencies: ["CryptoSwift"]),
        .target(
            name: "Totp",
            dependencies: ["TotpCore", "Base32"]),
        .testTarget(
            name: "TotpTests",
            dependencies: ["TotpCore"]),
    ]
)
