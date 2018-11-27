// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Freight",
    products: [
        .library(
            name: "Freight",
            targets: ["Freight"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Freight",
            dependencies: []),
        .target(
            name: "RealmFreight",
            dependencies: ["Freight"]),
        .testTarget(
            name: "FreightTests",
            dependencies: ["Freight"]),
    ]
)
