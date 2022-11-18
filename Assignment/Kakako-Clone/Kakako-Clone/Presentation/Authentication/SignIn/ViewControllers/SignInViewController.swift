//
//  ViewController.swift
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

final class SignInViewController: BaseViewController {
    
    //MARK: Properties
    var disposeBag = DisposeBag()
    
    //MARK: UI Components
    private let signinView = SignInView()
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        bindTapAction()
    }
}

//MARK: Extension
extension SignInViewController {
    func requestSignin() {
        guard let email = signinView.emailNumberTextField.text else { return }
        guard let password = signinView.passwordTextField.text else { return }
        
        SigninAPI.shared.signin(param: SigninRequest(
            emailOrContact: email,
            password: password)) { response, err in
            print(response as Any)
        }
    }
    private func bindTapAction() {
        signinView.makeAccountButton.rx.tap
            .withUnretained(self)
            .subscribe(onNext: { owner, _ in
                let nextVC = SignUpViewController()
                owner.navigationController?.pushViewController(nextVC, animated: true)
            })
            .disposed(by: disposeBag)
        
        signinView.kakaoLoginButton.rx.tap
            .withUnretained(self)
            .subscribe(onNext: { owner, _ in
                let nextVC = OnBoardingViewController()
                owner.navigationController?.pushViewController(nextVC, animated: true)
                self.requestSignin()
            })
            .disposed(by: disposeBag)
        
        let textFields = [signinView.emailNumberTextField, signinView.passwordTextField]
        Observable.combineLatest(textFields.map{$0.rx.text.orEmpty})
            .map{$0.map {$0.isEmpty}}
            .map{!$0.contains(true)}
            .bind { Bool in
                self.signinView.kakaoLoginButton.isEnabled = Bool
                self.signinView.kakaoLoginButton.backgroundColor = Bool ? .kakaoDefault : .systemGray6
            }
            .disposed(by: disposeBag)
    }
    
    private func setLayout() {
        view.addSubview(signinView)
        signinView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
