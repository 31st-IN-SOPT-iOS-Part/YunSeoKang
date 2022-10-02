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
    
    //MARK: UIComponents
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
    
    private lazy var textFieldStackView: UIStackView = {
        let sv = UIStackView()
        sv.alignment = .center
        sv.axis = .vertical
        sv.distribution = .fill
        return sv
    }()
    
    private let kakaLoginButton: UIButton = {
        let btn = UIButton()
        btn.setTitle(I18N.Auth.loginKakao, for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = .systemGray6
        btn.layer.cornerRadius = 4
        return btn
    }()
    
    private let makeAccountButton: UIButton = {
        let btn = UIButton()
        btn.setTitle(I18N.Auth.newAccount, for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = .systemGray6
        btn.layer.cornerRadius = 4
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
        setLayout()
    }
}

//MARK: Extension
extension LoginVC {
    
    private func setLayout() {
        view.addSubViews(startKakao, descriptionLogin, emailNumberTextField, passwordTextField, kakaLoginButton, makeAccountButton, findAccountLabel)
        
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
        
        kakaLoginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
            make.height.equalTo(width * (44/375))
        }
        
        makeAccountButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(kakaLoginButton.snp.bottom).offset(20)
            make.height.equalTo(width * (44/375))
        }
        
        findAccountLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(makeAccountButton.snp.bottom).offset(16)
        }
    }
}

