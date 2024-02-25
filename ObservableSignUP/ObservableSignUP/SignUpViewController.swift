//
//  SignUpViewController.swift
//  ObservableSignUP
//
//  Created by 김재석 on 2/22/24.
//


import UIKit
import SnapKit

class SignUpViewController: BaseViewController {

    let idTextField = {
        let view = UITextField()
        view.placeholder = "사용할 아이디를 입력해 주세요"
        view.font = .systemFont(ofSize: 16)
        view.backgroundColor = .white
        view.layer.cornerRadius = 4
        view.textAlignment = .center
        view.addTarget(
            self,
            action: #selector(idTextFieldOnChange),
            for: .editingChanged
        )
        return view
    }()
    
    let idGuideLabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 14)
        view.backgroundColor = .clear
        return view
    }()

    let passwordTextField = {
        let view = UITextField()
        view.placeholder = "사용할 비밀번호를 입력해 주세요"
        view.font = .systemFont(ofSize: 16)
        view.isSecureTextEntry = true
        view.backgroundColor = .white
        view.layer.cornerRadius = 4
        view.textAlignment = .center
        view.addTarget(
            self,
            action: #selector(passwordTextFieldOnChange),
            for: .editingChanged
        )
        return view
    }()
    
    let passwordGuideLabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 14)
        view.backgroundColor = .clear
        return view
    }()
    
    let confirmPasswordTextField = {
        let view = UITextField()
        view.placeholder = "비밀번호 확인"
        view.font = .systemFont(ofSize: 16)
        view.isSecureTextEntry = true
        view.backgroundColor = .white
        view.layer.cornerRadius = 4
        view.textAlignment = .center
        view.addTarget(
            self,
            action: #selector(confirmPasswordTextFieldOnChange),
            for: .editingChanged
        )
        return view
    }()
    
    let confirmPasswordGuideLabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 14)
        view.backgroundColor = .clear
        return view
    }()
    
    let signupButton = {
        let view = UIButton()
        view.setTitle("회원가입", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 4
        return view
    }()
    
    let viewModel = SignUpViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.outputIdText.bind { value in
            self.idGuideLabel.text = value
        }
        
        viewModel.outputIdTextColor.bind { value in
            self.idGuideLabel.textColor = value ? .systemGreen : .systemRed
        }
        
        viewModel.outputPasswordText.bind { value in
            self.passwordGuideLabel.text = value
        }
        
        viewModel.outputPasswordTextColor.bind { value in
            self.passwordGuideLabel.textColor = value ? .systemGreen : .systemRed
        }
        
        viewModel.outputConfirmPasswordText.bind { value in
            self.confirmPasswordGuideLabel.text = value
        }
        
        viewModel.outputConfirmPasswordTextColor.bind { value in
            self.confirmPasswordGuideLabel.textColor = value ? .systemGreen : .systemRed
        }
        
        viewModel.buttonColor.bind { value in
            self.signupButton.backgroundColor = value ? .systemGreen : .white
            
        }
    }

    override func configureHierarchy() {
        view.addSubview(idTextField)
        view.addSubview(idGuideLabel)
        view.addSubview(passwordTextField)
        view.addSubview(passwordGuideLabel)
        view.addSubview(confirmPasswordTextField)
        view.addSubview(confirmPasswordGuideLabel)
        view.addSubview(signupButton)
    }

    override func configureConstraints() {
        idTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.horizontalEdges.equalToSuperview().inset(40)
        }
        
        idGuideLabel.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview().inset(40)
            make.height.equalTo(34)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(idGuideLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview().inset(40)
            make.height.equalTo(40)
        }
        
        passwordGuideLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview().inset(40)
            make.height.equalTo(34)
        }
        
        confirmPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordGuideLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview().inset(40)
            make.height.equalTo(40)
        }
        
        confirmPasswordGuideLabel.snp.makeConstraints { make in
            make.top.equalTo(confirmPasswordTextField.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview().inset(40)
            make.height.equalTo(34)
        }
        
        signupButton.snp.makeConstraints { make in
            make.top.equalTo(confirmPasswordGuideLabel.snp.bottom).offset(60)
            make.horizontalEdges.equalToSuperview().inset(40)
            make.height.equalTo(40)
        }
    }

    override func configureView() {
        super.configureView()
        
        navigationItem.title = "회원가입"
    }
}
