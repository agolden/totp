// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TotpCore",
    products: [
    .library(
      name: "TotpCore",
      targets: ["TotpCore"]
    )
  ],
  
    dependencies: [
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", from: "1.3.8"),
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
