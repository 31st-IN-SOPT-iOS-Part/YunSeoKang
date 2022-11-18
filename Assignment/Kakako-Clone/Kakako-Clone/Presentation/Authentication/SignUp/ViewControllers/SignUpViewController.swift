//
//  SignUpVC.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/10/01.
//

import UIKit

import RxCocoa
import RxSwift
import SnapKit
import Then
import Moya

final class SignUpViewController: BaseViewController {
    //MARK: Properties
    var disposBag = DisposeBag()

    //MARK: UI Components
    private let signUpView = SingUpView()
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        bindTapAction()
    }
}

//MARK: Extension
extension SignUpViewController {
    func requestSignup() {
        print("?")
        guard let email = signUpView.emailNumberTextField.text else { return }
        guard let password = signUpView.passwordTextField.text else { return }
        guard let checkPassword = signUpView.checkPasswordTextField.text else { return }
        
        SignupAPI.shared.signup(param: SignupRequest(
            emailOrContact: email,
            password: password,
            passwordCheck: checkPassword)) { response, err in
                print(response as Any)
            }
    }
    
    private func bindTapAction() {
        signUpView.makeAccountButton.rx.tap
            .withUnretained(self)
            .subscribe { (owner, _) in
                let nextVC = OnBoardingViewController()
                nextVC.modalPresentationStyle = .overFullScreen
                owner.present(nextVC, animated: true)
                self.requestSignup()
            }
            .disposed(by: disposBag)
        
        let textFields = [signUpView.emailNumberTextField,
                          signUpView.passwordTextField,
                          signUpView.checkPasswordTextField]
        Observable.combineLatest(textFields.map{$0.rx.text.orEmpty})
            .map{$0.map{$0.isEmpty}}
            .map{!$0.contains(true)}
            .bind { Bool in
                self.signUpView.makeAccountButton.isEnabled = Bool
                self.signUpView.makeAccountButton.backgroundColor = Bool ? .kakaoDefault : .systemGray6
            }
            .disposed(by: disposBag)
    }
    
    private func setLayout() {
        view.addSubview(signUpView)
        signUpView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
