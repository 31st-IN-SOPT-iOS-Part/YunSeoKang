//
//  SignInView.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/11/01.
//

import UIKit

import SnapKit
import Then

class SignInView: BaseView {
    //MARK: UI Components
    private let startKakaoLabel = UILabel()
    private let descriptionLoginLabel = UILabel()
    let emailNumberTextField = AuthTextField()
    let passwordTextField = AuthTextField()
    let kakaoLoginButton = AuthButton()
    lazy var makeAccountButton = AuthButton()
    private let findAccountLabel = UILabel()
    
    override func setUI() {
        startKakaoLabel.do {
            $0.text = I18N.Auth.startKakao
            $0.textColor = .black
            $0.font = .AppleSDGothicNeoMedium(ofSize: 22)
        }
        
        descriptionLoginLabel.do {
            $0.text = I18N.Auth.loginDescription
            $0.textColor = .systemGray
            $0.numberOfLines = 2
            $0.font = .AppleSDGothicNeoRegular(ofSize: 15)
            $0.textAlignment = .center
        }
        
        emailNumberTextField.do {
            $0.placeholder = I18N.Auth.emailOrPhone
        }
        
        passwordTextField.do {
            $0.placeholder = I18N.Auth.password
            $0.isSecureTextEntry = true
        }
        
        kakaoLoginButton.do {
            $0.setTitle(I18N.Auth.loginKakao, for: .normal)
        }
        
        makeAccountButton.do {
            $0.setTitle(I18N.Auth.newAccount, for: .normal)
            $0.isEnabled = true
        }
        
        findAccountLabel.do {
            $0.text = I18N.Auth.findAccount
            $0.textColor = .black
            $0.font = .AppleSDGothicNeoRegular(ofSize: 12)
        }
    }
    
    override func setLayout() {
        addSubViews(startKakaoLabel, descriptionLoginLabel, emailNumberTextField, passwordTextField, kakaoLoginButton, makeAccountButton, findAccountLabel)
        
        startKakaoLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(60)
            make.centerX.equalToSuperview()
        }
        
        descriptionLoginLabel.snp.makeConstraints { make in
            make.top.equalTo(startKakaoLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        emailNumberTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(descriptionLoginLabel.snp.bottom).offset(70)
            make.height.equalTo(width * (44/width))
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(emailNumberTextField.snp.bottom).offset(16)
            make.height.equalTo(width * (44/width))
        }
        
        kakaoLoginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
            make.height.equalTo(width * (44/width))
        }
        
        makeAccountButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(kakaoLoginButton.snp.bottom).offset(16)
            make.height.equalTo(width * (44/width))
        }
        
        findAccountLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(makeAccountButton.snp.bottom).offset(16)
        }
    }
}
