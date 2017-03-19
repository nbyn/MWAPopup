//
//  MWAPopup.swift
//  MWAPopup
//
//  Created by Malik Wahaj Ahmed on 18/03/2017.
//  Copyright © 2017 Malik Wahaj Ahmed. All rights reserved.
//

import Foundation
import UIKit

enum PopupType:String {
    
    case SingleButton
    case TwoButtons
    case TextFieldTwoButtons
}

class MWAPopup : UIViewController {
    
    // Private IBOutlets
    
    @IBOutlet weak private var backgroundView: UIView!
    @IBOutlet weak private var backgroundImageView: UIImageView!
    
    @IBOutlet weak private var popupView: UIView!
    @IBOutlet weak private var popupBackground: UIImageView!
    
    @IBOutlet weak private var headingLabel: UILabel!
    @IBOutlet weak private var messageLabel: UILabel!
    
    @IBOutlet weak private var firstButton: UIButton!
    @IBOutlet weak private var secondButton: UIButton!
    
    @IBOutlet private var buttonsArray: [UIButton]!
    
    @IBOutlet weak private var textField: UITextField!
    
    // Private Properties
    
    private var currentPopupType:PopupType?
    
    private var titleString = ""
    private var messageString = ""
    
    private var buttonTitles:[String]?
    
    private var popupImage:UIImage?
    private var buttonImages:[UIImage]?
    
    private var isCustomPopup = false
    
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
    
    // Button Events
    var onFirstButtonTapped: (()->())?
    var onSecondButtonTapped: (()->())?
    
    
    //
    /// Create Custom Popup
    ///
    /// - Parameters:
    ///   - aPopupType: .SingleButton OR .TwoButtons OR .TextFieldTwoButtons
    ///   - titleString: This string will be shown on heading of a Popup
    ///   - messageString: This string will be shown as message on a Popup
    ///   - buttonNames: Button Titles Array
    /// - Returns: Instance of MWAPopup
    
    static func createPopup(aPopupType: PopupType,  titleString: String,
                            messageString: String, buttonNames:[String]) -> MWAPopup? {
        
        if let newPopup = UIStoryboard(name: "MWAPopup", bundle: nil).instantiateViewController(withIdentifier: aPopupType.rawValue) as? MWAPopup {
            newPopup.titleString = titleString
            newPopup.messageString = messageString
            newPopup.currentPopupType = aPopupType
            newPopup.buttonTitles = buttonNames
            newPopup.isCustomPopup = false
            return newPopup
        }
        return MWAPopup()
    }
    
    //
    /// Create Custom Popup With Images
    ///
    /// - Parameters:
    ///   - aPopupType: .SingleButton OR .TwoButtons OR .TextFieldTwoButtons
    ///   - titleString: This string will be shown on heading of a Popup
    ///   - messageString: This string will be shown as message on a Popup
    ///   - popupImage: UIImage for Popup Background
    ///   - buttonImages: Array Of Button UIImages
    /// - Returns: Instance of MWAPopup
    
    static func createPopupWithImages(aPopupType: PopupType,  titleString: String,
                                      messageString: String,popupImage:UIImage, buttonImages:[UIImage]) -> MWAPopup? {
        
        if let newPopup = UIStoryboard(name: "MWAPopup", bundle: nil).instantiateViewController(withIdentifier: aPopupType.rawValue) as? MWAPopup {
            newPopup.titleString = titleString
            newPopup.messageString = messageString
            newPopup.currentPopupType = aPopupType
            newPopup.popupImage = popupImage
            newPopup.buttonImages = buttonImages
            newPopup.isCustomPopup = true
            return newPopup
        }
        return MWAPopup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if currentPopupType == .TextFieldTwoButtons {
            NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow), name: Notification.Name.UIKeyboardWillShow, object: nil)
            
            NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide), name: Notification.Name.UIKeyboardWillHide, object: nil)
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if currentPopupType == .TextFieldTwoButtons {
            NotificationCenter.default.removeObserver(self, name: Notification.Name.UIKeyboardWillShow, object: nil)
            NotificationCenter.default.removeObserver(self, name: Notification.Name.UIKeyboardWillHide, object: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headingLabel.text = titleString
        messageLabel.text = messageString
        
        backgroundView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        if let _ = backgroundColor {
            backgroundView.backgroundColor = backgroundColor
        }
        
        if let _ = backgroundImage {
            backgroundImageView.isHidden = false
            backgroundImageView.image = backgroundImage
        }
        
        if let _ = popupTextColor {
            headingLabel.textColor = popupTextColor
            messageLabel.textColor = popupTextColor
        }
        
        if let pFont = popupFontName {
            headingLabel.font = UIFont(name: pFont, size: headingLabel.font.pointSize)
            messageLabel.font = UIFont(name: pFont, size: messageLabel.font.pointSize)
        }
        
        if let _ = titleTextFont {
            headingLabel.font = titleTextFont
        }
        
        if let _ = titleTextColor {
            headingLabel.textColor = titleTextColor
        }
        
        if let _ = messageTextFont {
            messageLabel.font = messageTextFont
        }
        
        if let _ = messageTextColor {
            messageLabel.textColor = messageTextColor
        }
        
        if !isCustomPopup {
            popupBackground.isHidden = true
            if let bTitles = buttonTitles {
                setButtonTitles(buttonTitles: bTitles)
            }
        }
        else {
            popupBackground.image = popupImage
            if let bImages = buttonImages{
                setButtonImages(buttonImages: bImages)
            }
        }
        
        if currentPopupType == .TextFieldTwoButtons {
            textFieldText = textField.text
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.size.height))
            textField.leftView = paddingView
            textField.leftViewMode = .always
            
            
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(backgroundTapped(tapGestureRecognizer:)))
            backgroundView.isUserInteractionEnabled = true
            backgroundView.addGestureRecognizer(tapGestureRecognizer)
            
            
            setTextFieldParams()
        }
        
    }
    
    func backgroundTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    private func setTextFieldParams() {
        
        if let tfBorderStyle = textFieldBorderStyle,
            let tfStyle = UITextBorderStyle(rawValue: tfBorderStyle) {
            textField.borderStyle = tfStyle
        }
        
        if let tfBackgroundImage = textFieldBackgroundImage {
            textField.background = tfBackgroundImage
        }
        if let tfBackgroundColor = textFieldBackgroundColor {
            textField.backgroundColor = tfBackgroundColor
        }
        
        if let tfColor = textFieldTextColor {
            textField.textColor = tfColor
        }
        if let tfFont = textFieldTextFont {
            textField.font = tfFont
        }
        
        if let tfPlaceholder = textFieldPlaceholder {
            textField.placeholder = tfPlaceholder
            
            if let tfPlaceHolderFont = textFieldPlaceholderFont {
                textField.attributedPlaceholder =
                    NSAttributedString(string: tfPlaceholder,
                                       attributes: [NSFontAttributeName : tfPlaceHolderFont])
            }
            
            if let tfPlaceholderColor = textFieldPlaceholderColor {
                textField.attributedPlaceholder =
                    NSAttributedString(string: tfPlaceholder, attributes: [NSForegroundColorAttributeName : tfPlaceholderColor])
            }
        }
    }
    
    func setTextFieldBorderStyle(style:UITextBorderStyle) {
        textFieldBorderStyle = style.rawValue
    }
    
    private func setButtonTitles(buttonTitles: [String]) {
        
        guard buttonTitles.count > 0 else {
            print("=== MWAPopup ERROR:: Provide Atleast One Button Name")
            return
        }
        if self.currentPopupType == .SingleButton {
            guard buttonTitles.count == 1 else {
                print("=== MWAPopup ERROR:: Button Count Mismatch With Popup Type")
                return
            }
            self.buttonsArray[0].setTitle(buttonTitles[0], for: .normal)
        }
        else {
            guard buttonTitles.count == 2 else {
                print("=== MWAPopup ERROR:: Only Two Buttons Allowed")
                return
            }
            for i in 0..<buttonTitles.count {
                self.buttonsArray[i].setTitle(buttonTitles[i], for: .normal)
            }
        }
    }
    
    private func setButtonImages(buttonImages: [UIImage]) {
        
        guard buttonImages.count > 0 else {
            print("=== MWAPopup ERROR:: Provide Atleast One Button Name")
            return
        }
        if self.currentPopupType == .SingleButton {
            guard buttonImages.count == 1 else {
                print("=== MWAPopup ERROR:: Button Count Mismatch With Popup Type")
                return
            }
            self.buttonsArray[0].backgroundColor = .clear
            self.buttonsArray[0].setTitle("", for: .normal)
            self.buttonsArray[0].setImage(buttonImages[0], for: .normal)
        }
        else {
            guard buttonImages.count == 2 else {
                print("=== MWAPopup ERROR:: Only Two Buttons Allowed")
                return
            }
            for i in 0..<buttonImages.count {
                self.buttonsArray[i].backgroundColor = .clear
                self.buttonsArray[i].setTitle("", for: .normal)
                self.buttonsArray[i].setImage(buttonImages[i], for: .normal)
            }
        }
    }
    
    @IBAction private func firstButtonTapped(_ sender: UIButton) {
        onFirstButtonTapped?()
        close()
    }
    
    @IBAction private func secondButtonTapped(_ sender: UIButton) {
        onSecondButtonTapped?()
        close()
    }
    
    func show(vc:UIViewController) {
        vc.addChildViewController(self)
        vc.view.addSubview(self.view)
    }
    
    func close() {
        self.view.removeFromSuperview()
        self.removeFromParentViewController()
    }
    
}

extension MWAPopup : UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        textFieldText = textField.text
        return true
    }
}

extension MWAPopup {
    
    func keyBoardWillShow() {
        if self.view.frame.origin.y >= 0 {
            setViewMovedUp(movedUp: true)
        }
        else if self.view.frame.origin.y < 0 {
            setViewMovedUp(movedUp: false)
        }
    }
    
    func keyBoardWillHide() {
        if self.view.frame.origin.y >= 0 {
            setViewMovedUp(movedUp: true)
        }
        else if self.view.frame.origin.y < 0 {
            setViewMovedUp(movedUp: false)
        }
    }
    
    func setViewMovedUp(movedUp: Bool){
        
        let kOffset:CGFloat = 80.0
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.3)
        
        var rect = self.view.frame
        
        if movedUp {
            rect.origin.y -= kOffset;
            rect.size.height += kOffset;
        }
        else
        {
            rect.origin.y += kOffset;
            rect.size.height -= kOffset;
        }
        self.view.frame = rect;
        UIView.commitAnimations()
    }
    
}
