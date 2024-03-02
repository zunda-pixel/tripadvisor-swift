// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "tripadvisor-swift",
  platforms: [
    .iOS(.v13),
    .macOS(.v10_15),
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
    .package(url: "https://github.com/pointfreeco/swift-tagged", from: "0.1.0"),
  ],
  targets: [
    .target(
      name: "TripadvisorKit",
      dependencies: [
        .product(name: "HTTPTypes", package: "swift-http-types"),
        .product(name: "HTTPTypesFoundation", package: "swift-http-types"),
        .product(name: "Tagged", package: "swift-tagged"),
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

package.targets
  .filter { ![.system, .binary, .plugin, .macro].contains($0.type) }
  .forEach { $0.swiftSettings = SwiftSetting.allCases }

extension SwiftSetting {
  static let forwardTrailingClosures: Self = .enableUpcomingFeature("ForwardTrailingClosures")              // SE-0286, Swift 5.3,  SwiftPM 5.8+
  static let existentialAny: Self = .enableUpcomingFeature("ExistentialAny")                                // SE-0335, Swift 5.6,  SwiftPM 5.8+
  static let bareSlashRegexLiterals: Self = .enableUpcomingFeature("BareSlashRegexLiterals")                // SE-0354, Swift 5.7,  SwiftPM 5.8+
  static let conciseMagicFile: Self = .enableUpcomingFeature("ConciseMagicFile")                            // SE-0274, Swift 5.8,  SwiftPM 5.8+
  static let importObjcForwardDeclarations: Self = .enableUpcomingFeature("ImportObjcForwardDeclarations")  // SE-0384, Swift 5.9,  SwiftPM 5.9+
  static let disableOutwardActorInference: Self = .enableUpcomingFeature("DisableOutwardActorInference")    // SE-0401, Swift 5.9,  SwiftPM 5.9+
  static let deprecateApplicationMain: Self = .enableUpcomingFeature("DeprecateApplicationMain")            // SE-0383, Swift 5.10, SwiftPM 5.10+
  static let isolatedDefaultValues: Self = .enableUpcomingFeature("IsolatedDefaultValues")                  // SE-0411, Swift 5.10, SwiftPM 5.10+
  static let globalConcurrency: Self = .enableUpcomingFeature("GlobalConcurrency")                          // SE-0412, Swift 5.10, SwiftPM 5.10+
}

extension SwiftSetting: CaseIterable {
  public static var allCases: [Self] {
    [
      .forwardTrailingClosures,
      .existentialAny,
      .bareSlashRegexLiterals,
      .conciseMagicFile,
      .importObjcForwardDeclarations,
      .disableOutwardActorInference,
      .deprecateApplicationMain,
      .isolatedDefaultValues,
      .globalConcurrency
    ]
  }
}
