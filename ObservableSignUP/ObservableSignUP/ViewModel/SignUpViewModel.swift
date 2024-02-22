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
            outputIdText.text = "4 ~ 12자 사이의 id를 입력해 주세요"
            outputIdText.outputTextColor = "systemRed"
        } else {
            outputIdText.text = "사용가능한 id입니다!"
            outputIdText.outputTextColor = "systemGreen"
        }
    }

    private func passwordValidation(_ inputPasswordText: String) {
        print("password validation enter")
        if inputPasswordText.count < 4 || inputPasswordText.count > 16 {
            outputPasswordText.text = "4 ~ 16자 사이의 비밀번호를 입력해 주세요"
        } else {
            outputPasswordText.text = "사용가능한 비밀번호입니다!"
        }
    }

    private func confirmPasswordValidation(_ inputConfirmPasswordText: String) {
        if inputConfirmPasswordText.isEmpty {
            outputConfirmPasswordText.text = "비밀번호를 다시 입력해 주세요"
        } else if inputConfirmPasswordText != inputPasswordText.text {
            outputConfirmPasswordText.text = "비밀번호가 일치하지 않습니다"
        } else {
            outputConfirmPasswordText.text = "비밀번호가 일치합니다!"
        }
    }
}
