//
//  SignUpVC.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/10/01.
//

import UIKit

class SignUpVC: UIViewController {
    
    //MARK: Properties
    let width = UIScreen.main.bounds.width

    //MARK: UIComponents
    private let startKakao: UILabel = {
        let lb = UILabel()
        lb.text = I18N.Auth.startKakao
        lb.textColor = .black
        lb.font = .systemFont(ofSize: 18, weight: .medium)
        return lb
    }()
    
    private let emailNumberTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = I18N.Auth.emailOrPhone
        tf.textColor = .black
        tf.font = .systemFont(ofSize: 17, weight: .regular)
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = I18N.Auth.password
        tf.textColor = .black
        tf.font = .systemFont(ofSize: 17, weight: .regular)
        return tf
    }()
    
    private let checkPasswordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = I18N.Auth.checkPassword
        tf.textColor = .black
        tf.font = .systemFont(ofSize: 17, weight: .regular)
        return tf
    }()
    
    private let makeAccountButton: UIButton = {
        let btn = UIButton()
        btn.setTitle(I18N.Auth.newAccount, for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = .systemGray6
        btn.layer.cornerRadius = 4
        return btn
    }()
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
}

//MARK: Extension
extension SignUpVC {
    private func setLayout() {
        view.addSubViews(startKakao, emailNumberTextField, passwordTextField,
                         checkPasswordTextField, makeAccountButton)
        
        startKakao.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(60)
            make.centerX.equalToSuperview()
        }
        
        emailNumberTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(startKakao.snp.bottom).offset(100)
            make.height.equalTo(width * (44/375))
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(emailNumberTextField.snp.bottom).offset(16)
            make.height.equalTo(width * (44/375))
        }
        
        checkPasswordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(passwordTextField.snp.bottom).offset(16)
            make.height.equalTo(width * (44/375))
        }
        
        makeAccountButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(checkPasswordTextField.snp.bottom).offset(30)
            make.height.equalTo(width * (44/375))
        }
    }
}
