//
//  ViewController.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/10/01.
//

import UIKit
import SnapKit

final class LoginVC: UIViewController {
    
    //MARK: Properties
    private let width = UIScreen.main.bounds.width
    
    //MARK: UI Components
    private let startKakaoLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Auth.startKakao
        label.textColor = .black
        label.font = .AppleSDGothicNeoMedium(ofSize: 22)
        return label
    }()
    
    private let descriptionLogin: UILabel = {
        let label = UILabel()
        label.text = I18N.Auth.loginDescription
        label.textColor = .systemGray
        label.numberOfLines = 2
        label.font = .AppleSDGothicNeoRegular(ofSize: 15)
        label.textAlignment = .center
        return label
    }()
    
    private let emailNumberTextField: AuthTextField = {
        let textField = AuthTextField()
        textField.placeholder = I18N.Auth.emailOrPhone
        return textField
    }()
    
    private let passwordTextField: AuthTextField = {
        let textField = AuthTextField()
        textField.placeholder = I18N.Auth.password
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let kakaoLoginButton: AuthButton = {
        let button = AuthButton()
        button.setTitle(I18N.Auth.loginKakao, for: .normal)
        return button
    }()
    
    private lazy var makeAccountButton: AuthButton = {
        let button = AuthButton()
        button.setTitle(I18N.Auth.newAccount, for: .normal)
        button.isEnabled = true
        return button
    }()
    
    private let findAccountLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Auth.findAccount
        label.textColor = .black
        label.font = .AppleSDGothicNeoRegular(ofSize: 12)
        return label
    }()
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setAddTarget()
    }
}

//MARK: Extension
extension LoginVC {
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setAddTarget() {
        kakaoLoginButton.addTarget(self, action: #selector(touchUpOnboarding), for: .touchUpInside)
        makeAccountButton.addTarget(self, action: #selector(touchUpSignup), for: .touchUpInside)
        emailNumberTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    private func setLayout() {
        view.addSubViews(startKakaoLabel, descriptionLogin, emailNumberTextField, passwordTextField, kakaoLoginButton, makeAccountButton, findAccountLabel)
        
        startKakaoLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(60)
            make.centerX.equalToSuperview()
        }
        
        descriptionLogin.snp.makeConstraints { make in
            make.top.equalTo(startKakaoLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        emailNumberTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(descriptionLogin.snp.bottom).offset(70)
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
    
    private func pushToSignUpView() {
        let nextVC = SignUpVC()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    private func presentToOnboardingView() {
        let nextVC = OnBoardingVC()
        nextVC.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        
        if let id = emailNumberTextField.text {
            nextVC.name = id
        }
        self.present(nextVC, animated: true)
    }
    
    @objc
    private func touchUpSignup() {
        pushToSignUpView()
    }
    
    @objc
    private func touchUpOnboarding() {
        presentToOnboardingView()
    }
    
    @objc
    private func textFieldDidChange() {
        if emailNumberTextField.hasText,
           passwordTextField.hasText {
            kakaoLoginButton.isEnabled = true
            kakaoLoginButton.backgroundColor = .kakaoLogin
        } else {
            kakaoLoginButton.isEnabled = false
            kakaoLoginButton.backgroundColor = .systemGray6
        }
    }
}

