// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "tripadvisor-swift",
  platforms: [
    .iOS(.v17),
    .macOS(.v14),
  ],
  products: [
    .library(
      name: "TripadvisorKit",
      targets: ["TripadvisorKit"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-http-types", from: "1.0.3"),
    .package(url: "https://github.com/pointfreeco/swift-tagged", from: "0.1.0"),
    .package(url: "https://github.com/zunda-pixel/swift-currency", from: "0.0.1"),
    .package(url: "https://github.com/swiftlang/swift-testing", from: "0.11.0"),
  ],
  targets: [
    .target(
      name: "TripadvisorKit",
      dependencies: [
        .product(name: "HTTPTypes", package: "swift-http-types"),
        .product(name: "HTTPTypesFoundation", package: "swift-http-types"),
        .product(name: "Tagged", package: "swift-tagged"),
        .product(name: "Currency", package: "swift-currency"),
        .target(name: "HTTPClient"),
      ]
    ),
    .target(
      name: "HTTPClient",
      dependencies: [
        .product(name: "HTTPTypes", package: "swift-http-types"),
        .product(name: "HTTPTypesFoundation", package: "swift-http-types"),
      ]
    ),
    .testTarget(
      name: "TripadvisorKitTests",
      dependencies: [
        .target(name: "TripadvisorKit"),
        .product(name: "Testing", package: "swift-testing"),
      ]
    ),
  ]
)
