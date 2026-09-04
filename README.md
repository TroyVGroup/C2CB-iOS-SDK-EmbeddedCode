# C2CB-iOS-Library

[![Version](https://img.shields.io/cocoapods/v/C2CB-iOS-Library.svg?style=flat)](https://cocoapods.org/pods/C2CB-iOS-Library)
[![License](https://img.shields.io/cocoapods/l/C2CB-iOS-Library.svg?style=flat)](https://cocoapods.org/pods/C2CB-iOS-Library)
[![Platform](https://img.shields.io/cocoapods/p/C2CB-iOS-Library.svg?style=flat)](https://cocoapods.org/pods/C2CB-iOS-Library)

The **C2CB-iOS-Library** provides C2C Icons that allow iOS applications to integrate **Call, SMS, and Email** functionality.

The library can be integrated into existing or new iOS applications using **CocoaPods** or **Swift Package Manager (SPM)**.

The library supports:

- Swift
- Objective-C
- SwiftUI
- CocoaPods
- Swift Package Manager

---

## Example

To run the example project, clone the repository and run `pod install` from the Example directory first.

---

# Installation

The C2C Icons Library can be installed using either **CocoaPods** or **Swift Package Manager**.

---

## CocoaPods

C2CB-iOS-Library is available through [CocoaPods](https://cocoapods.org/).

To install the library using CocoaPods, add the following to your `Podfile`:

```ruby
pod 'C2CB-iOS-Library', '~> 4.0'  
```
Then run:

```ruby
pod install
```

After installation, open the generated .xcworkspace file.

For more information, visit:

https://cocoapods.org/pods/C2CB-iOS-Library

## Swift Package Manager

The C2C Icons Library also supports Swift Package Manager (SPM).

To add the library using SPM:

Open your project in Xcode.
Select File → Add Package Dependencies...
Enter the following repository URL:
```ruby
https://github.com/TroyVGroup/C2CB-iOS-Package.git
```
Select the required package version.
Add the package to your application target.

After the package has been added, import the library:
```ruby
import C2CB_iOS_Library
```
# Integration

After installing the library, you can integrate C2C Icons using SwiftUI, Swift, or Objective-C.

The C2C Icons provide:

Call
SMS
Email

A unique channel_id is required to configure the C2C Icons.

## SwiftUI Integration

For SwiftUI applications, use UIViewRepresentable to integrate the existing C2CSdkCustomView.

### Step 1: Create the SwiftUI Wrapper

Create a Swift file named:
```ruby
CustomIconsRowView.swift
```
Add the following code:
```ruby
import SwiftUI
import C2CB_iOS_Library

struct CustomIconsRowView: UIViewRepresentable {

    let channel_id: String

    func makeUIView(context: Context) -> C2CSdkCustomView {
        let view = C2CSdkCustomView()

        view.channel_id = channel_id
        view.frame = CGRect(
            x: 0,
            y: 0,
            width: 120,
            height: 40
        )

        return view
    }

    func updateUIView(
        _ uiView: C2CSdkCustomView,
        context: Context
    ) {
        uiView.channel_id = channel_id
    }
}
```
### Step 2: Add C2C Icons to a SwiftUI View

Use the following code wherever you want to display the C2C Icons:
```ruby
CustomIconsRowView(
    channel_id: "YOUR_CHANNEL_ID"
)
.frame(width: 120, height: 40)
```
Replace YOUR_CHANNEL_ID with the unique channel ID provided for your C2C configuration.

### Example
```ruby
import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack {
            Text("C2C Icons")
                .font(.headline)

            CustomIconsRowView(
                channel_id: "YOUR_CHANNEL_ID"
            )
            .frame(width: 120, height: 40)
        }
    }
}
```
### Multiple Screens

The same CustomIconsRowView can be reused on multiple screens by providing a different channel_id.
```ruby
CustomIconsRowView(
    channel_id: "CHANNEL_ID_1"
)
```
On another screen:
```ruby
CustomIconsRowView(
    channel_id: "CHANNEL_ID_2"
)
```
## Swift Integration

For a UIKit-based Swift application, use C2CSdkCustomView.

### Step 1: Import the Library

Add the following to your view controller:
```ruby
import C2CB_iOS_Library
```
### Step 2: Add the C2C View

Open your Main.storyboard or XIB file.

Add a UIView to the view controller where you want to display the C2C Icons.

Set the Custom Class to:
```ruby
C2CSdkCustomView
```
Set the Module to:
```ruby
C2CB_iOS_Library
```
### Step 3: Create an Outlet

Create an outlet in your view controller:
```ruby
@IBOutlet weak var <your_view_name>: C2CSdkCustomView!
```
### Step 4: Configure the Channel

Set the unique channel_id in viewDidLoad() or viewWillAppear():
```ruby
<your_view_name>.channel_id = "YOUR_CHANNEL_ID"
```
Replace YOUR_CHANNEL_ID with your unique C2C channel ID.

## Objective-C Integration

For Objective-C applications, use C2CSdkCustomView.

### Step 1: Import the Library

In your ViewController.h file:
```ruby
@import C2CB_iOS_Library;
```
### Step 2: Add the C2C View

Open your Main.storyboard or XIB file.

Add a UIView to the view controller where you want to display the C2C Icons.

Set the Custom Class to:
```ruby
C2CSdkCustomView
```
Set the Module to:
```ruby
C2CB_iOS_Library
```
### Step 3: Create an Outlet

In your ViewController.h file:
```ruby
@property (weak, nonatomic) IBOutlet C2CSdkCustomView *<your_view_name>;
```
### Step 4: Configure the Channel

Set the unique channel_id in viewDidLoad or viewWillAppear:
```ruby
self.<your_view_name>.channel_id = @"YOUR_CHANNEL_ID";
```
Replace YOUR_CHANNEL_ID with your unique C2C channel ID.

# Required Permissions

Depending on the C2C functionality used by your application, the following permissions and capabilities may be required.

Add the required entries to your application's Info.plist:

```ruby
<key>NSMicrophoneUsageDescription</key>
<string>Would you like to grant access to your microphone?</string>

<key>NSVoIPUsageDescription</key>
<string>Would you like to grant access to make and receive phone calls?</string>

<key>NSLocationWhenInUseUsageDescription</key>
<string>Would you like to grant access to your location?</string>

<key>NSLocationAlwaysUsageDescription</key>
<string>Would you like to grant access to your location?</string>

<key>NSPhotoLibraryUsageDescription</key>
<string>Would you like to grant access to your photo library to upload images related to an issue?</string>

<key>NSCameraUsageDescription</key>
<string>Would you like to grant access to your camera to capture photos for reporting issues?</string>

<key>UIBackgroundModes</key>
<array>
    <string>audio</string>
    <string>voip</string>
</array>
```
Note: Add only the permissions and capabilities required by the functionality used by your application.

# Quick Integration

The basic integration process is:

```ruby
1. Install C2C Icons Library
        ↓
2. Choose CocoaPods or Swift Package Manager
        ↓
3. Import C2CB_iOS_Library
        ↓
4. Choose SwiftUI, Swift, or Objective-C
        ↓
5. Add C2CSdkCustomView or CustomIconsRowView
        ↓
6. Provide your unique channel_id
        ↓
7. Configure required permissions
        ↓
8. Build and run
```

### SwiftUI
```ruby
CustomIconsRowView(
    channel_id: "YOUR_CHANNEL_ID"
)
```
### Swift
```ruby
yourView.channel_id = "YOUR_CHANNEL_ID"
```
### Objective-C
```ruby
self.yourView.channel_id = @"YOUR_CHANNEL_ID";
```
# Requirements
iOS application
Xcode
CocoaPods or Swift Package Manager
A valid C2C channel_id

# Author

Satyam Kumar

satyam.kumar@vgroup.net

# License

C2CB-iOS-Library is available under the MIT license.

See the LICENSE file for more information.


### I recommend one small change

Your current README says:

```ruby
pod 'C2CB-iOS-Library'
```
while your newer documentation says:
```ruby
pod 'C2CB-iOS-Library', '~> 4.0'
```

The CocoaPods page currently lists the published version separately, so don't hard-code 4.0 unless 4.0 is actually the version published to CocoaPods. If your current published version is different, use the version shown on the official CocoaPods page.

Also, I would keep the SPM repository URL only in the SPM section and keep the CocoaPods URL only in the CocoaPods section. This makes the README much cleaner and easier for a developer to follow.
