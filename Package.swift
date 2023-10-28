// swift-tools-version: 5.9

import PackageDescription

let MyApp = Package(
    name: "MyTestApps",
    products: [
        .executable(name: "MyApp", targets: ["MyApp"])
    ],
    dependencies: [
    .package(name:"swift-win32",
             url: "https://github.com/tonka3000/swift-win32.git",
             .branch("swift-5.9")
             )
    //.package(path: "../swift-win32")
  ],
    targets: [
        .executableTarget(
            name: "MyApp",
            dependencies: [
                .product(name: "SwiftWin32UI", package: "swift-win32")],
            path: "MyApp",
            exclude: ["Info.plist", "MyApp.exe.manifest"],
            swiftSettings: [.unsafeFlags(["-parse-as-library"])]
        )
    ]
)