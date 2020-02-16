//
//  UIAlertController+keyboard.swift
//  HomeWork_2.6
//
//  Created by Macbook on 16.02.2020.
//  Copyright © 2020 Alex Dev. All rights reserved.
//

import UIKit

extension ViewController {
    
    func addDoneButtonTo(_ textField: UITextField) {
           
           let keyboardToolbar = UIToolbar()
           textField.inputAccessoryView = keyboardToolbar
           keyboardToolbar.sizeToFit()
           
           let doneButton = UIBarButtonItem(title:"Done",
                                            style: .done,
                                            target: self,
                                            action: #selector(didTapDone))
           
           let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                               target: nil,
                                               action: nil)
           
           keyboardToolbar.items = [flexBarButton, doneButton]
       }
       
       
       @objc private func didTapDone() {
           view.endEditing(true)
       }
       
       //MARK: - UIAlertController
         func showAlert() {
            
            let alert = UIAlertController(title: "😱", message: "wrong format", preferredStyle: .alert)
            let okAlert = UIAlertAction(title: "Ok", style: .cancel)
            alert.addAction(okAlert)
            present(alert, animated: true)
            
        }
}
