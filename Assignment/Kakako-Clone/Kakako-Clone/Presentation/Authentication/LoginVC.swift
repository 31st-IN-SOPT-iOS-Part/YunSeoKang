//
//  ViewController.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/10/01.
//

import UIKit
import SnapKit

class LoginVC: UIViewController {
    
    //MARK: Properties
    let width = UIScreen.main.bounds.width
    
    //MARK: UI Components
    private let startKakao: UILabel = {
        let lb = UILabel()
        lb.text = I18N.Auth.startKakao
        lb.textColor = .black
        lb.font = .systemFont(ofSize: 22, weight: .medium)
        return lb
    }()
    
    private let descriptionLogin: UILabel = {
        let lb = UILabel()
        lb.text = I18N.Auth.loginDescription
        lb.textColor = .systemGray
        lb.numberOfLines = 2
        lb.font = .systemFont(ofSize: 12, weight: .regular)
        lb.textAlignment = .center
        return lb
    }()
    
    private let emailNumberTextField: AuthTextField = {
        let tf = AuthTextField()
        tf.placeholder = I18N.Auth.emailOrPhone
        return tf
    }()
    
    private let passwordTextField: AuthTextField = {
        let tf = AuthTextField()
        tf.placeholder = I18N.Auth.password
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let kakaoLoginButton: AuthButton = {
        let btn = AuthButton()
        btn.setTitle(I18N.Auth.loginKakao, for: .normal)
        return btn
    }()
    
    private lazy var makeAccountButton: AuthButton = {
        let btn = AuthButton()
        btn.setTitle(I18N.Auth.newAccount, for: .normal)
        btn.isEnabled = true
        return btn
    }()
    
    private let findAccountLabel: UILabel = {
        let lb = UILabel()
        lb.text = I18N.Auth.findAccount
        lb.textColor = .black
        lb.font = .systemFont(ofSize: 12, weight: .regular)
        return lb
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
        view.addSubViews(startKakao, descriptionLogin, emailNumberTextField, passwordTextField, kakaoLoginButton, makeAccountButton, findAccountLabel)
        
        startKakao.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(60)
            make.centerX.equalToSuperview()
        }
        
        descriptionLogin.snp.makeConstraints { make in
            make.top.equalTo(startKakao.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        emailNumberTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(descriptionLogin.snp.bottom).offset(70)
            make.height.equalTo(width * (44/375))
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(emailNumberTextField.snp.bottom).offset(16)
            make.height.equalTo(width * (44/375))
        }
        
        kakaoLoginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
            make.height.equalTo(width * (44/375))
        }
        
        makeAccountButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(kakaoLoginButton.snp.bottom).offset(16)
            make.height.equalTo(width * (44/375))
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
        let nextVC = onBoardingVC()
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

