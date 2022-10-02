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

    //MARK: UIComponents
    private let welcomeLabel: UILabel = {
        let lb = UILabel()
        lb.text = "님 환영합니다"
        lb.font = .systemFont(ofSize: 20, weight: .medium)
        return lb
    }()
    
    private let startKakaoButton: UIButton = {
        let btn = UIButton()
        btn.setTitle(I18N.Auth.startKakaoButton, for: .normal)
        btn.backgroundColor = .kakaoLogin
        btn.layer.cornerRadius = 4
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
}

//MARK: Extension
extension onBoardingVC {
    private func setLayout() {
        view.addSubViews(welcomeLabel, startKakaoButton)
        
        welcomeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(230)
        }
        
        let width = UIScreen.main.bounds.width
        
        startKakaoButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(welcomeLabel.snp.bottom).offset(100)
            make.height.equalTo(width * (44/375))
        }
    }
}
