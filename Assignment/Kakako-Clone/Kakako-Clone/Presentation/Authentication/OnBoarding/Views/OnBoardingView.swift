//
//  OnBoardingView.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/11/01.
//

import UIKit

class OnBoardingView: BaseView {
    
    //MARK: Properties
    var name: String?
    
    //MARK: UI Components
    private lazy var welcomeLabel = UILabel()
    let checkButton = AuthButton()
    
    override func setUI() {
        welcomeLabel.do {
            $0.text = "\(name ?? "사용자")님\n환영합니다"
            $0.numberOfLines = 2
            $0.textAlignment = .center
            $0.font = .AppleSDGothicNeoMedium(ofSize: 22)
        }
        
        checkButton.do {
            $0.setTitle(I18N.Auth.checkButton, for: .normal)
            $0.backgroundColor = .kakaoLogin
            $0.isEnabled = true
        }
    }
    
    override func setLayout() {
        addSubViews(welcomeLabel, checkButton)
        
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

}
