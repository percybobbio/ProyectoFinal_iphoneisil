//
//  ViewController.swift
//  Proyecto_final
//
//  Created by Percy Bobbio on 10/12/20.
//  Copyright © 2020 Percy Bobbio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtDNI: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var contenidoCajaSesion: UIView!
    @IBOutlet weak var constraintBottomScroll: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.changeStyleSelected(false, toinput: txtDNI)
        self.changeStyleSelected(false, toinput: txtPassword)
        
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



extension ViewController: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.changeStyleSelected(true, toinput: textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        self.changeStyleSelected(false, toinput: textField)
    }
}

