//
//  SignUpViewController+Extension.swift
//  ObservableSignUP
//
//  Created by 김재석 on 2/22/24.
//

import UIKit

extension SignUpViewController {
    
    @objc func idTextFieldOnChange() {
        
        guard let text = idTextField.text else { return }
        
        viewModel.inputIdText.value = text
    }
    
    @objc func passwordTextFieldOnChange() {
        
        guard let text = passwordTextField.text else { return }
        
        viewModel.inputPasswordText.value = text
    }
    
    @objc func confirmPasswordTextFieldOnChange() {
        
        guard let text = confirmPasswordTextField.text else { return }
        
        viewModel.inputConfirmPasswordText.value = text
    }
}
