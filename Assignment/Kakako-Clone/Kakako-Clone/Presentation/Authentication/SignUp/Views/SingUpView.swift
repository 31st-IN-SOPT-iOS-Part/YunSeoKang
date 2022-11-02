//
//  SingUpView.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/11/01.
//

import UIKit

class SingUpView: BaseView {

    //MARK: UI Components
    private let startKakao = UILabel()
    let emailNumberTextField = AuthTextField()
    let passwordTextField = AuthTextField()
    let checkPasswordTextField = AuthTextField()
    let makeAccountButton = AuthButton()

    override func setUI() {
        startKakao.do {
            $0.text = I18N.Auth.startKakao
            $0.textColor = .black
            $0.font = .AppleSDGothicNeoMedium(ofSize: 22)
        }
        
        emailNumberTextField.do {
            $0.placeholder = I18N.Auth.emailOrPhone
        }
        
        passwordTextField.do {
            $0.placeholder = I18N.Auth.password
            $0.isSecureTextEntry = true
        }
        
        checkPasswordTextField.do {
            $0.placeholder = I18N.Auth.checkPassword
            $0.isSecureTextEntry = true
        }
        
        makeAccountButton.do {
            $0.setTitle(I18N.Auth.newAccount, for: .normal)
        }
    }
    
    override func setLayout() {
        addSubViews(startKakao, emailNumberTextField, passwordTextField,
                         checkPasswordTextField, makeAccountButton)
        
        startKakao.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(60)
            make.centerX.equalToSuperview()
        }
        
        emailNumberTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(startKakao.snp.bottom).offset(100)
            make.height.equalTo(width * (44/width))
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(emailNumberTextField.snp.bottom).offset(16)
            make.height.equalTo(width * (44/width))
        }
        
        checkPasswordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(passwordTextField.snp.bottom).offset(16)
            make.height.equalTo(width * (44/width))
        }
        
        makeAccountButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(checkPasswordTextField.snp.bottom).offset(30)
            make.height.equalTo(width * (44/width))
        }
    }
}
