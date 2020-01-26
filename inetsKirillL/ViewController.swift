//
//  ViewController.swift
//  inetsKirillL
//
//  Created by Глеб on 05/11/2018.
//  Copyright © 2018 Глеб. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func setRounded() {
        self.layer.cornerRadius = (self.frame.width / 2) //instead of let radius = CGRectGetWidth(self.frame) / 2
        self.layer.masksToBounds = true
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    var usersArray = [
        (loginStr: "gleber", passwordStr: "123456"),
        (loginStr: "mona", passwordStr: "liza"),
        (loginStr: "ponchik", passwordStr: "sladkiy"),
        (loginStr: "admin", passwordStr: "123456")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.navigationItem.title = "Filters" - заголовок на navigation bar
        
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scroll?.addGestureRecognizer(hideKeyboardGesture)
        
    }
    
    @objc func keyboardWasShown(notification: Notification) {
        
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        self.scroll?.contentInset = contentInsets
        scroll?.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(notifcation: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scroll?.contentInset = contentInsets
        scroll?.scrollIndicatorInsets = contentInsets
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func hideKeyboard() {
        self.scroll?.endEditing(true)
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func register(_ sender: Any) {
        for (_, v) in usersArray.enumerated() {
            if v.loginStr == loginInput.text! {
                showAlert(message: "User already exists")
            } else {
                if loginInput.text == "" || passwordInput.text == "" || loginInput.text!.contains(" ") == true || passwordInput.text!.contains(" ") {
                    showAlert(message: "Error. Incorrect login or password. Login and password must consist of letters and numbers")
                    loginInput.text = ""
                    passwordInput.text = ""
                } else {
                    let tuple = (loginStr: loginInput.text!, passwordStr: passwordInput.text!)
                    usersArray.append(tuple)
                    showAlert(message: "Success. user created")
//                  УБИРАЮ ТЕКСТ ИЗ ПОЛЛЕЙ ВВОДА ЛОГИНА И ПАРОЛЯ
                    loginInput.text = ""
                    passwordInput.text = ""
                    print(usersArray)
                    
                    showAlert(message: "Error. Incorrect login or password. Login and password must consist of letters and numbers")
                }
            }
        }
    }

    @IBAction func signIn(_ sender: Any) {
        let tuple = (loginStr: loginInput.text!, passwordStr: passwordInput.text!)
        if (usersArray.contains { $0 == tuple }) == true {
            performSegue(withIdentifier: "go", sender: nil)
            
//          УБИРАЮ ТЕКСТ ИЗ ПОЛЛЕЙ ВВОДА ЛОГИНА И ПАРОЛЯ
            loginInput.text = ""
            passwordInput.text = ""
        } else {
            showAlert(message: "Error. Wrong login or password")
        }
    }
}

