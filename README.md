MWAPopup

A Custom Popup For iOS written in Swift 3

MWAPopup is an iOS utility for developers to easily integrate the Popup UI in their applications.

There are three Generic types of Popups that can be used:

1. Single Button Popup (Usually used for information messages)
2. Two Button Popup (Usually used for asking permissions, Logout etc)
3. TextField With Two Buttons Popup (Usually used In Cases like Forgot Password or asking some quick information from user)

# Screenshots

# Installation

Just Drag & Drop the folder named 'MWAPopupSource' in your project and you are ready to go.

# Usage

Single Button Popup

    let popup = MWAPopup.createPopup(aPopupType: .SingleButton, titleString: "Message", messageString: "This is a message for you.", buttonNames: ["OK"]) popup?.show(vc: self) popup?.onFirstButtonTapped = { () in print("OK Tapped") }
