// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ZGTestSDKPackage",
    platforms: [
          .macOS(.v12), .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ZGTestSDK",
            targets: ["ZGTestSDK"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(
            url: "https://github.com/firebase/firebase-ios-sdk.git",
            .upToNextMajor(from: "10.4.0")
          ),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(
            name: "ZGTestSDK",
            path: "./Sources/ZGTestSDK.xcframework"),
        .target(
          name: "ZGTestSDK",
          dependencies: [
            // The product(s) you want (e.g. FirebaseAuth).
            .product(name: "FirebaseAppCheck", package: "Firebase"),
          ]
        ),
    ]
)
