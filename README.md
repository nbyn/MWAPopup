# MWAPopup

A Custom Popup For iOS written in Swift 3

MWAPopup is an iOS utility for developers to easily integrate the Popup UI in their applications.



# Screenshots

# Installation

Just Drag & Drop the folder named 'MWAPopupSource' in your project and you are ready to go.

# Usage

There are three Generic types of Popups that can be used:

1. Single Button Popup (Usually used for information messages)
2. Two Button Popup (Usually used for asking permissions, Logout etc)
3. TextField With Two Buttons Popup (Usually used In Cases like Forgot Password or asking some quick information from user)

Custom Popup

    let popup = MWAPopup.createPopup(aPopupType: .SingleButton,
                                        titleString: "Message",
                                        messageString: "This is a message for you.",
                                        buttonNames: ["OK"]) 
    popup?.show(vc: self)
    popup?.onFirstButtonTapped = { () in 
        print("OK Tapped") 
    }
    
Custom Popup With Images

    let popup = MWAPopup.createPopupWithImages(aPopupType: .SingleButton,
                                                   titleString: "Message",
                                                   messageString: "This is a message for you.",
                                                   popupImage: UIImage(named:"popup_bg")!,
                                                   buttonImages: [UIImage(named:"ok_btn")!])
    popup?.show(vc: self)
    popup?.onFirstButtonTapped = { () in 
        print("OK Tapped") 
    }

Popup Type: .SingleButton OR .TwoButton OR .TextFieldTwoButtons
Button Titles: Use String Array for UIButton Titles
Button Images: Use UIImage Array for UButtons


Following properties can also be modified accordingly:

    // Background Properties
    
    var backgroundImage:UIImage?
    var backgroundColor:UIColor?
    
    // Popup Properties
    // It will set both heading and message label properties as same
    
    var popupFontName : String?
    var popupTextColor : UIColor?
    
    // Title Properties
    
    var titleTextFont:UIFont?
    var titleTextColor:UIColor?
    
    // Message Properties
    
    var messageTextFont:UIFont?
    var messageTextColor:UIColor?

    // TextField Properties
    var textFieldBorderStyle:Int?
    var textFieldBackgroundImage:UIImage?
    var textFieldBackgroundColor:UIColor?
    var textFieldText:String?
    var textFieldTextFont:UIFont?
    var textFieldTextColor:UIColor?
    var textFieldPlaceholder:String?
    var textFieldPlaceholderFont:UIFont?
    var textFieldPlaceholderColor:UIColor?
    
    
## Author

Malik Wahaj Ahmed
