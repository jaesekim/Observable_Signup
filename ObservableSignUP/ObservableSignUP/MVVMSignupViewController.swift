//
//  MVVMSignupViewController.swift
//  ObservableSignUP
//
//  Created by 김재석 on 2/23/24.
//

import UIKit
import SnapKit

class MVVMSignupViewController: UIViewController {

    let nicknameTextField = {
        let view = UITextField()
        view.backgroundColor = .white
        view.placeholder = "닉네임을 입력해 주세요"
        return view
    }()

    let nicknameLabel = {
        let view = UILabel()
        view.text = "4 ~ 8자 사이의 닉네임을 입력해 주세요"
        return view
    }()

    let passwordTextField = {
        let view = UITextField()
        view.backgroundColor = .white
        view.placeholder = "비밀번호를 입력해 주세요"
        return view
    }()

    let passwordLabel = {
        let view = UILabel()
        view.text = "8 ~ 16자 사이의 비밀번호를 입력해 주세요"
        return view
    }()

    let viewModel = MVVMSignupViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureConstraints()
        configureView()
        
        nicknameTextField.addTarget(
            self,
            action: #selector(nicknameTextFieldOnChange),
            for: .editingChanged
        )
        
        passwordTextField.addTarget(
            self,
            action: #selector(passwordTextFieldOnChange),
            for: .editingChanged
        )
    }
    
    func configureHierarchy() {
        view.addSubview(nicknameTextField)
        view.addSubview(nicknameLabel)
        view.addSubview(passwordTextField)
        view.addSubview(passwordLabel)
    }
    
    func configureConstraints() {
        nicknameTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(40)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        nicknameLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(40)
            make.top.equalTo(nicknameTextField.snp.bottom).offset(8)
        }
        passwordTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(40)
            make.top.equalTo(nicknameLabel.snp.bottom).offset(8)
        }
        passwordLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(40)
            make.top.equalTo(passwordTextField.snp.bottom).offset(8)
        }
    }
    
    func configureView() {
        view.backgroundColor = .systemGray5
    }
    
    @objc func nicknameTextFieldOnChange() {
        
        guard let text = nicknameTextField.text else { return }
    
        if text.count < 4 || text.count > 8 {
            self.nicknameLabel.text = "4 ~ 8자 사이의 닉네임을 입력해 주세요"
            self.nicknameLabel.textColor = .systemRed
        } else {
            self.nicknameLabel.text = "사용가능한 닉네임입니다!"
            self.nicknameLabel.textColor = .systemGreen
        }
    }
    
    @objc func passwordTextFieldOnChange() {
        
        guard let text = passwordTextField.text else { return }
        
        if text.count < 8 || text.count > 16 {
            passwordLabel.text = "8 ~ 16자 사이의 비밀번호를 입력해 주세요"
            passwordLabel.textColor = .systemRed
        } else {
            passwordLabel.text = "사용가능한 비밀번호입니다!"
            passwordLabel.textColor = .systemGreen
        }
    }
}
