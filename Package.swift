// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "swift-service-context",
    products: [
        .library(
            name: "CandleServiceContextModule",
            targets: [
                "CandleServiceContextModule"
            ]
        ),
    ],
    targets: [
        .target(name: "CandleServiceContextModule"),

        // ==== --------------------------------------------------------------------------------------------------------
        // MARK: Tests

        .testTarget(
            name: "ServiceContextTests",
            dependencies: [
                .target(name: "CandleServiceContextModule")
            ]
        ),
    ]
)

for target in package.targets {
    var settings = target.swiftSettings ?? []
    settings.append(.enableExperimentalFeature("StrictConcurrency=complete"))
    target.swiftSettings = settings
}
