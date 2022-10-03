//
//  onBoardingVC.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/10/01.
//

import UIKit

class onBoardingVC: UIViewController {
    
    //MARK: Properties
    var name: String?

    //MARK: UI Components
    private let welcomeLabel: UILabel = {
        let lb = UILabel()
        lb.text = "님 환영합니다"
        lb.font = .systemFont(ofSize: 20, weight: .medium)
        return lb
    }()
    
    private let checkButton: AuthButton = {
        let btn = AuthButton()
        btn.setTitle(I18N.Auth.checkButton, for: .normal)
        btn.backgroundColor = .kakaoLogin
        btn.isEnabled = true
        return btn
    }()
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setAddTarget()
        setLayout()
    }
}

//MARK: Extension
extension onBoardingVC {
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setAddTarget() {
        checkButton.addTarget(self, action: #selector(touchCheckButton), for: .touchUpInside)
    }
    
    private func setLayout() {
        view.addSubViews(welcomeLabel, checkButton)
        
        welcomeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(230)
        }
        
        let width = UIScreen.main.bounds.width
        
        checkButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(welcomeLabel.snp.bottom).offset(100)
            make.height.equalTo(width * (44/375))
        }
    }
    
    private func dismissOnboarding() {
        let beforeVC = self.presentingViewController
        guard let mainVC = beforeVC as? UINavigationController else {return}
        mainVC.popToRootViewController(animated: true)
        self.dismiss(animated: true)
    }
    
    @objc
    private func touchCheckButton() {
        dismissOnboarding()
    }
}
