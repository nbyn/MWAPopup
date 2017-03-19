//
//  ViewController.swift
//  MWAPopup
//
//  Created by Malik Wahaj Ahmed on 18/03/2017.
//  Copyright © 2017 Malik Wahaj Ahmed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var buttonArray = ["Single Button Custom Popup","Two Button Custom Popup","Single Textfield Custom Popup","Single Button Custom Popup (Image)","Two Button Custom Popup (Image)","Single Textfield Custom Popup (Image)"]
    
    func buttonTapped(sender:UIButton) {
        if let cell = sender.superview?.superview as? UITableViewCell,
            let indexPath = tableView.indexPath(for: cell) {
            
            switch indexPath.row {
            case 0: createSingleButtonCustomPopup(); break
            case 1: createTwoButtonCustomPopup(); break
            case 2: createSingleTextfieldCustomPopup(); break
            case 3: createSingleButtonCustomPopupWithImages(); break
            case 4: createTwoButtonCustomPopupWithImages(); break
            case 5: createSingleTextfieldCustomPopupWithImages(); break
            
            default: createSingleButtonCustomPopup()
                
            }
        }
    }

    func createSingleButtonCustomPopup() {
    
        let popup = MWAPopup.createPopup(aPopupType: .SingleButton, titleString: "Message", messageString: "This is a message for you.", buttonNames: ["OK"])
        
        //  popup?.backgroundColor = .red
        //  popup?.backgroundImage = UIImage(named:"bg")
        //  popup?.popupFontName = "Arial"
        //  popup?.popupTextColor = .blue

        popup?.titleTextFont = UIFont.systemFont(ofSize: 22)
        popup?.titleTextColor = .black
        
        popup?.messageTextFont = UIFont.boldSystemFont(ofSize: 16)
        popup?.messageTextColor = .black
        
        popup?.show(vc: self)
        popup?.onFirstButtonTapped = { () in
            print("OK Tapped")
        }
        
    }
    
    func createTwoButtonCustomPopup() {
        
        let popup = MWAPopup.createPopup(aPopupType: .TwoButtons, titleString: "Ask Question", messageString: "Do you want to do this?", buttonNames: ["Yes", "No"])
        
        //  popup?.backgroundColor = .red
        //  popup?.backgroundImage = UIImage(named:"bg")
        //  popup?.popupFontName = "Arial"
        //  popup?.popupTextColor = .blue
        
        popup?.titleTextFont = UIFont.systemFont(ofSize: 22)
        popup?.titleTextColor = .black
        
        popup?.messageTextFont = UIFont.boldSystemFont(ofSize: 16)
        popup?.messageTextColor = .black
        
        popup?.show(vc: self)
        popup?.onFirstButtonTapped = { () in
            print("Yes Tapped")
        }
        popup?.onSecondButtonTapped = { () in
            print("No Tapped")
        }
    }
    func createSingleTextfieldCustomPopup() {
        
        let popup = MWAPopup.createPopup(aPopupType: .TextFieldTwoButtons, titleString: "Get Information", messageString: "Please enter your email address", buttonNames: ["Done", "Cancel"])
        
        //  popup?.backgroundColor = .red
        //  popup?.backgroundImage = UIImage(named:"bg")
        //  popup?.popupFontName = "Arial"
        //  popup?.popupTextColor = .blue
        
        popup?.titleTextFont = UIFont.systemFont(ofSize: 22)
        popup?.titleTextColor = .black
        
        popup?.messageTextFont = UIFont.boldSystemFont(ofSize: 16)
        popup?.messageTextColor = .black
        
        popup?.setTextFieldBorderStyle(style: .none)
        
        //  popup?.textFieldBackgroundImage = UIImage(named: "textfield_bg")
        popup?.textFieldBackgroundColor = .gray
        
        popup?.textFieldTextColor = .white
        popup?.textFieldTextFont = UIFont.systemFont(ofSize: 12)
        
        popup?.textFieldPlaceholder = "Email Address"

        popup?.textFieldPlaceholderColor = .white
        popup?.textFieldPlaceholderFont = UIFont.boldSystemFont(ofSize: 11)

        popup?.show(vc: self)
        popup?.onFirstButtonTapped = { () in
            print("Entered Information::" + (popup?.textFieldText)!)
        }
        popup?.onSecondButtonTapped = { () in
            print("Cancel Tapped")
        }
    }
    
    func createSingleButtonCustomPopupWithImages() {
        
        let popup = MWAPopup.createPopupWithImages(aPopupType: .SingleButton,
                                                   titleString: "Message",
                                                   messageString: "This is a message for you.",
                                                   popupImage: UIImage(named:"popup_bg") ?? UIImage(),
                                                   buttonImages: [
                                                    UIImage(named:"ok_btn") ?? UIImage()])
        
        //  popup?.backgroundColor = .red
        //  popup?.backgroundImage = UIImage(named:"bg")
        //  popup?.popupFontName = "Arial"
        //  popup?.popupTextColor = .blue
        
        popup?.titleTextFont = UIFont.systemFont(ofSize: 22)
        popup?.titleTextColor = .black
        
        popup?.messageTextFont = UIFont.boldSystemFont(ofSize: 16)
        popup?.messageTextColor = .black
        
        popup?.show(vc: self)
        popup?.onFirstButtonTapped = { () in
            print("OK Tapped")
        }
        
    }
    
    func createTwoButtonCustomPopupWithImages() {
        
        let popup = MWAPopup.createPopupWithImages(aPopupType: .TwoButtons,
                                                 titleString: "Ask Question",
                                                 messageString: "Do you want to do this?",
                                                 popupImage: UIImage(named:"popup_bg") ?? UIImage(),
                                                 buttonImages: [
                                                    UIImage(named:"yes_btn") ?? UIImage(),
                                                    UIImage(named:"no_btn") ?? UIImage()])
        
        //  popup?.backgroundColor = .red
        //  popup?.backgroundImage = UIImage(named:"bg")
        //  popup?.popupFontName = "Arial"
        //  popup?.popupTextColor = .blue
        
        popup?.titleTextFont = UIFont.systemFont(ofSize: 22)
        popup?.titleTextColor = .black
        
        popup?.messageTextFont = UIFont.boldSystemFont(ofSize: 16)
        popup?.messageTextColor = .black

        popup?.show(vc: self)
        popup?.onFirstButtonTapped = { () in
            print("Yes Tapped")
        }
        popup?.onSecondButtonTapped = { () in
            print("No Tapped")
        }
    }
    
    func createSingleTextfieldCustomPopupWithImages() {
        
        let popup = MWAPopup.createPopupWithImages(aPopupType: .TextFieldTwoButtons,
                                                   titleString: "Get Information",
                                                 messageString: "Please enter your email address",
                                                 popupImage: UIImage(named:"popup_bg")!,
                                                 buttonImages: [
                                                    UIImage(named:"done_btn")!,
                                                    UIImage(named:"cancel_btn")!])
        
        //  popup?.backgroundColor = .red
        //  popup?.backgroundImage = UIImage(named:"bg")
        //  popup?.popupFontName = "Arial"
        //  popup?.popupTextColor = .blue
        
        popup?.titleTextFont = UIFont.systemFont(ofSize: 22)
        popup?.titleTextColor = .black
        
        popup?.messageTextFont = UIFont.boldSystemFont(ofSize: 16)
        popup?.messageTextColor = .black
        
        popup?.setTextFieldBorderStyle(style: .none)
        
        popup?.textFieldBackgroundImage = UIImage(named: "textfield_bg")
        //  popup?.textFieldBackgroundColor = .gray
        
        popup?.textFieldTextColor = .white
        popup?.textFieldTextFont = UIFont.systemFont(ofSize: 12)
        
        popup?.textFieldPlaceholder = "Email Address"
        popup?.textFieldPlaceholderFont = UIFont.systemFont(ofSize: 11)
        popup?.textFieldPlaceholderColor = .white
        
        popup?.show(vc: self)
        popup?.onFirstButtonTapped = { () in
            print("Entered Information::" + (popup?.textFieldText)!)
        }
        popup?.onSecondButtonTapped = { () in
            print("Cancel Tapped")
        }
    }
    
}

extension ViewController : UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buttonArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell"),
            let button = cell.contentView.viewWithTag(1) as? UIButton {
            
            button.setTitle(buttonArray[indexPath.row], for: .normal)
            button.addTarget(self, action: #selector(self.buttonTapped(sender:)), for: .touchUpInside)
            
            return cell
        }
        return UITableViewCell()
    }
}
