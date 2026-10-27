//
//  Package.swift
//  C2CB-iOS-Library
//
//  Created by V Group on 19/12/24.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "C2CB-iOS-Library",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "C2CB-iOS-Library",
            targets: ["C2CB-iOS-Library"]
        )
    ],
    dependencies: [
           // If TwilioVoice is available as a Swift Package
           .package(url: "https://github.com/twilio/twilio-voice-ios", from: "6.0.0") // Replace with actual URL and version
       ],
    targets: [
        .binaryTarget(
            name: "C2CB_iOS_Library",
            path: "Frameworks/C2CB_iOS_Library.xcframework"
        ),
        .target(
            name: "C2CB-iOS-Library",
            dependencies: [
                "C2CB_iOS_Library",
                .product(name: "TwilioVoice", package: "twilio-voice-ios")
            ],
            path: "Sources",
            exclude: ["Info.plist"]
        )
    ]
)
