// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "candle-swift-service-context",
    products: [
        .library(
            name: "CandleServiceContextModule",
            targets: [
                "CandleServiceContextModule"
            ]
        ),

        // Deprecated/legacy module
        .library(
            name: "InstrumentationBaggage",
            targets: [
                "InstrumentationBaggage"
            ]
        ),
    ],
    targets: [
        .target(name: "CandleServiceContextModule"),

        // Deprecated/legacy module
        .target(
            name: "InstrumentationBaggage",
            dependencies: [
                .target(name: "CandleServiceContextModule")
            ]
        ),

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
