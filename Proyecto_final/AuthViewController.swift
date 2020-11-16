//
//  ViewController.swift
//  Proyecto_final
//
//  Created by Percy Bobbio on 10/12/20.
//  Copyright © 2020 Percy Bobbio. All rights reserved.
//

import UIKit
import FirebaseAnalytics
import FirebaseAuth

class AuthViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnRegistrar: UIButton!
    @IBOutlet weak var btnAcceder: UIButton!
    @IBOutlet weak var constraintBottomScroll: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Autenticacion"
        self.changeStyleSelected(false, toinput: txtEmail)
        self.changeStyleSelected(false, toinput: txtPassword)
        
        //analytics Event
        Analytics.logEvent("InitScreen", parameters: ["message":"integraciones Firebase completa"])
        
    }
    
    
    @IBAction func signupBtnAction(_ sender: Any) {
        if let email = txtEmail.text, let password = txtPassword.text{
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                if let result = result, error == nil{
                    self.navigationController?.pushViewController(HomeViewController(email: result.user.email!, provider: .basic), animated: true)
                }else{
                    let alertController = UIAlertController(title: "Error", message: "Se ha producido un error en el registro del usuario", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func loginbtnAction(_ sender: Any) {
    }
    
    func changeStyleSelected(_ isSelected: Bool, toinput input: UITextField){
        input.layer.borderColor = isSelected ? UIColor.red.cgColor : UIColor.darkGray.cgColor
        input.layer.cornerRadius = 10
    }
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            // Do any additional setup after loading the view.
                NotificationCenter.default.addObserver(self, selector: #selector(KeyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
                
                NotificationCenter.default.addObserver(self, selector: #selector(self.KeyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
            
            
            
            }
    

        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            NotificationCenter.default.removeObserver(self)
        }
        
        
               @objc func KeyboardWillShow(_ notification: Notification) {
                   let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
                   let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
                
                UIView.animate(withDuration: animationDuration){
                    self.constraintBottomScroll.constant = keyboardFrame.height
                    self.view.layoutIfNeeded()
                }
                  
               }
               @objc func KeyboardWillHide(_ notification: Notification){
                    
                _ = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
                      let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
                   
                   UIView.animate(withDuration: animationDuration){
                       self.constraintBottomScroll.constant = 0
                    self.view.layoutIfNeeded()
                    
                }
            }
    }



extension AuthViewController: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.changeStyleSelected(true, toinput: textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        self.changeStyleSelected(false, toinput: textField)
    }
}

