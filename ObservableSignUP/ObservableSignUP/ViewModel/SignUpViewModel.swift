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
    
    var outputIdTextColor = Observable("")
    var outputPasswordTextColor = Observable("")
    var outputConfirmPasswordTextColor = Observable("")
    
    var buttonColor = Observable("")

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
        if inputIdText.isEmpty {
            outputIdText.value = "아이디를 입력해 주세요"
            outputIdTextColor.value = "black"
        } else if inputIdText.count < 4 || inputIdText.count > 12 {
            outputIdText.value = "4 ~ 12자 사이의 id를 입력해 주세요"
            outputIdTextColor.value = "systemRed"
        } else {
            outputIdText.value = "사용가능한 id입니다!"
            outputIdTextColor.value = "systemGreen"
        }
        
        if outputIdTextColor.value == "systemGreen" && outputPasswordTextColor.value == "systemGreen" && outputConfirmPasswordTextColor.value == "systemGreen" {
            buttonColor.value = "systemGreen"
        } else {
            buttonColor.value = ""
        }
    }

    private func passwordValidation(_ inputPasswordText: String) {
        if inputPasswordText.isEmpty {
            outputPasswordText.value = "비밀번호를 입력해 주세요"
            outputPasswordTextColor.value = "black"
        } else if inputPasswordText.count < 4 || inputPasswordText.count > 16 {
            outputPasswordText.value = "4 ~ 16자 사이의 비밀번호를 입력해 주세요"
            outputPasswordTextColor.value = "systemRed"
        } else {
            outputPasswordText.value = "사용가능한 비밀번호입니다!"
            outputPasswordTextColor.value = "systemGreen"
        }
        
        if outputIdTextColor.value == "systemGreen" && outputPasswordTextColor.value == "systemGreen" && outputConfirmPasswordTextColor.value == "systemGreen" {
            buttonColor.value = "systemGreen"
        } else {
            buttonColor.value = ""
        }
    }

    private func confirmPasswordValidation(_ inputConfirmPasswordText: String) {
        if inputConfirmPasswordText.isEmpty {
            outputConfirmPasswordText.value = "비밀번호를 다시 입력해 주세요"
            outputConfirmPasswordTextColor.value = "black"
        } else if inputConfirmPasswordText != inputPasswordText.value {
            outputConfirmPasswordText.value = "비밀번호가 일치하지 않습니다"
            outputConfirmPasswordTextColor.value = "systemRed"
        } else {
            outputConfirmPasswordText.value = "비밀번호가 일치합니다!"
            outputConfirmPasswordTextColor.value = "systemGreen"
        }
        
        if outputIdTextColor.value == "systemGreen" && outputPasswordTextColor.value == "systemGreen" && outputConfirmPasswordTextColor.value == "systemGreen" {
            buttonColor.value = "systemGreen"
        } else {
            buttonColor.value = ""
        }
    }
}
