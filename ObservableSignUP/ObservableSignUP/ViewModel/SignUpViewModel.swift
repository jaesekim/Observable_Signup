//
//  SignUpViewModel.swift
//  ObservableSignUP
//
//  Created by 김재석 on 2/22/24.
//

import Foundation

class SignUpViewModel {

    var inputIdText = Observable("")
    var inputPasswordText = Observable("")
    var inputConfirmPasswordText = Observable("")

    var outputIdText = Observable("")
    var outputPasswordText = Observable("")
    var outputConfirmPasswordText = Observable("")
    
    var outputIdTextColor = Observable(false)
    var outputPasswordTextColor = Observable(false)
    var outputConfirmPasswordTextColor = Observable(false)
    
    var buttonColor = Observable(false)

    init() {
        inputIdText.bind { value in
            self.idValidation(value)
        }

        inputPasswordText.bind { value in
            self.passwordValidation(value)
        }

        inputConfirmPasswordText.bind { value in
            self.confirmPasswordValidation(value)
        }

    }

    private func idValidation(_ inputIdText: String) {

        // 길이
        if inputIdText.count < 4 || inputIdText.count > 12 {
            outputIdText.value = "4 ~ 12자 사이의 id를 입력해 주세요"
            outputIdTextColor.value = false
        } else {
            outputIdText.value = "사용가능한 id입니다!"
            outputIdTextColor.value = true
        }
        
        if outputIdTextColor.value && outputPasswordTextColor.value && outputConfirmPasswordTextColor.value {
            buttonColor.value = true
        } else {
            buttonColor.value = false
        }
    }

    private func passwordValidation(_ inputPasswordText: String) {
        if inputPasswordText.count < 4 || inputPasswordText.count > 16 {
            outputPasswordText.value = "4 ~ 16자 사이의 비밀번호를 입력해 주세요"
            outputPasswordTextColor.value = false
        } else {
            outputPasswordText.value = "사용가능한 비밀번호입니다!"
            outputPasswordTextColor.value = true
        }
        
        if outputIdTextColor.value && outputPasswordTextColor.value && outputConfirmPasswordTextColor.value {
            buttonColor.value = true
        } else {
            buttonColor.value = false
        }
        
        if inputPasswordText != inputConfirmPasswordText.value {
            outputConfirmPasswordText.value = "비밀번호가 일치하지 않습니다"
            outputConfirmPasswordTextColor.value = false
        }
    }

    private func confirmPasswordValidation(_ inputConfirmPasswordText: String) {
        if inputConfirmPasswordText.isEmpty {
            outputConfirmPasswordText.value = "비밀번호를 입력해 주세요"
            outputConfirmPasswordTextColor.value = false
        } else if inputConfirmPasswordText != inputPasswordText.value {
            outputConfirmPasswordText.value = "비밀번호가 일치하지 않습니다"
            outputConfirmPasswordTextColor.value = false
        } else {
            outputConfirmPasswordText.value = "비밀번호가 일치합니다!"
            outputConfirmPasswordTextColor.value = true
        }
        
        if outputIdTextColor.value && outputPasswordTextColor.value && outputConfirmPasswordTextColor.value {
            buttonColor.value = true
        } else {
            buttonColor.value = false
        }
    }
}
