//
//  onBoardingVC.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/10/01.
//

import UIKit

final class OnBoardingVC: UIViewController {
    
    //MARK: Properties
    var name: String?
    private let width = UIScreen.main.bounds.width

    //MARK: UI Components
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "\(name ?? "사용자")님\n환영합니다"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .AppleSDGothicNeoMedium(ofSize: 22)
        return label
    }()
    
    private let checkButton: AuthButton = {
        let button = AuthButton()
        button.setTitle(I18N.Auth.checkButton, for: .normal)
        button.backgroundColor = .kakaoLogin
        button.isEnabled = true
        return button
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
extension OnBoardingVC {
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
        
        checkButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(welcomeLabel.snp.bottom).offset(100)
            make.height.equalTo(width * (44/width))
        }
    }
    
    private func pushToTabBar() {
        let TabBarController = KakaotalkTabBarController()
//        if let window = UIApplication.shared.windows.first {
//            window.rootViewController = UINavigationController(rootViewController: TabBarController)
//        }
        
        // iOS 15 이상부터
        if let window = view.window?.windowScene?.keyWindow {
            window.rootViewController = UINavigationController(rootViewController: TabBarController)
        }
    }
    
    @objc
    private func touchCheckButton() {
        pushToTabBar()
    }
}
