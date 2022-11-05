//
//  ViewController.swift
//  4th_Seminar
//
//  Created by 강윤서 on 2022/11/05.
//



import UIKit

import Moya
import SnapKit
//import SwiftyColor
import Then

// MARK: - LoginViewController

final class LoginViewController: UIViewController {

    // MARK: - UI Components
    
    private let emailView = InputView()
    private let passwordView = InputView()
    private lazy var loginButton = UIButton().then {
        $0.backgroundColor = .systemBlue
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        $0.layer.cornerRadius = 8
        $0.addTarget(self, action: #selector(touchupLoginButton), for: .touchUpInside)
    }
    
    private let resultLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 30, weight: .bold)
        $0.numberOfLines = 2
        $0.textAlignment = .center
    }
    
    // MARK: - Variables
    
    let userProvider = MoyaProvider<UserRouter>(
        plugins: [NetworkLoggerPlugin(verbose: true)]
    )
    
    let titles = ["이메일", "비밀번호"]
    let placeholders = ["이메일을 입력하세요", "비밀번호를 입력하세요"]
    
    var loginData: LoginResponseDto?
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        layout()
    }
}

// MARK: - Extensions

extension LoginViewController {
    
    // MARK: - Layout Helpers
    
    private func layout() {
        view.backgroundColor = .white
        [emailView, passwordView, loginButton, resultLabel].forEach {
            view.addSubview($0)
        }
        
        emailView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(200)
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(60)
            $0.height.equalTo(52)
        }
        
        passwordView.snp.makeConstraints {
            $0.top.equalTo(emailView.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(emailView)
            $0.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordView.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(passwordView)
            $0.height.equalTo(48)
        }
        
        resultLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(loginButton.snp.bottom).offset(20)
        }
    }
    
    // MARK: - General Helpers
    
    private func config() {
        emailView.config(title: titles[0], placeholder: placeholders[0])
        passwordView.config(title: titles[1], placeholder: placeholders[1])
    }
    
    private func configResult(name: String) {
        resultLabel.text = "\(name)님\n환영합니다!!"
    }
    
    // MARK: - Action Helpers
    
    @objc
    private func touchupLoginButton() {
        if let email = emailView.popInput(),
           let password = passwordView.popInput() {
            let param = LoginRequestDto(email: email, name: password)
            login(param: param)
        }
    }
    
    // MARK: - Network Helpers
    
    private func login(param: LoginRequestDto) {
        userProvider.request(.login(param: param)) { response in
            switch response {
            case .success(let result):
                let status = result.statusCode
                if status >= 200 && status < 300 {
                    do {
                        self.loginData = try result.map(LoginResponseDto.self)
                        if let result = self.loginData?.result {
                            self.configResult(name: result.name)
                        }
                    }
                    catch(let error) {
                        print(error.localizedDescription)
                    }
                }
                if status >= 400 {
                    print("error")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
