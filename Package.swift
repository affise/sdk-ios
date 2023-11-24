// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Affise",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(name: "AffiseAttributionLib", targets: ["AffiseAttributionLib"]),
        .library(name: "AffiseModuleStatus", targets: ["AffiseModuleStatus"]),
        .library(name: "AffiseSKAdNetwork", targets: ["AffiseSKAdNetwork", "AffiseInternalWrapperObjC"]),
    ],
    targets: [
        .target(
            name: "AffiseAttributionLib",
            path: "AffiseAttributionLib",
            sources: [ "Classes" ],
            resources: [
               .process("Assets"),
            ]
        ),
        .target(
            name: "AffiseModuleStatus",
            dependencies: ["AffiseAttributionLib"],
            path: "AffiseModule/Status",
            sources: [ "Classes" ]
        ),
        .target(
            name: "AffiseSKAdNetwork",
            dependencies: ["AffiseInternalWrapperObjC"],
            path: "AffiseSKAdNetwork",
            sources: [ "Classes" ]
        ),
        .target(
            name: "AffiseInternalWrapperObjC",
            path: "AffiseSKAdNetwork",
            sources: [ "ObjC" ],
            publicHeadersPath: ".",
            linkerSettings: [
                .linkedFramework("StoreKit"),
            ]
        ),
        .target(
            name: "AffiseInternal",
            dependencies: [
                "AffiseAttributionLib",
                "AffiseSKAdNetwork",
            ],
            path: "AffiseInternal",
            sources: [ "Classes" ]
        ),
    ]
)
