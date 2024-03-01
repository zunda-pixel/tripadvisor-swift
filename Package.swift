// swift-tools-version: 5.10

import PackageDescription

let package = Package(
  name: "tripadvisor-swift",
  products: [
    .library(
      name: "TripadvisorKit",
      targets: ["TripadvisorKit"]
    ),
  ],
  targets: [
    .target(
      name: "TripadvisorKit"
    ),
    .testTarget(
      name: "TripadvisorKitTests",
      dependencies: [
        .target(name: "TripadvisorKit"),
      ]
    ),
  ]
)
