// swift-tools-version: 5.10

import PackageDescription

let package = Package(
  name: "tripadvisor-swift",
  platforms: [
    .iOS(.v16),
    .macOS(.v13),
  ],
  products: [
    .library(
      name: "TripadvisorKit",
      targets: ["TripadvisorKit"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-format", from: "509.0.0"),
    .package(url: "https://github.com/apple/swift-http-types", from: "1.0.3"),
  ],
  targets: [
    .target(
      name: "TripadvisorKit",
      dependencies: [
        .product(name: "HTTPTypes", package: "swift-http-types"),
        .product(name: "HTTPTypesFoundation", package: "swift-http-types"),
      ]
    ),
    .testTarget(
      name: "TripadvisorKitTests",
      dependencies: [
        .target(name: "TripadvisorKit"),
      ]
    ),
  ]
)
