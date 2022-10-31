//
//  FriendViewController.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/10/11.
//

import UIKit

final class FriendViewController: UIViewController {
    
    //MARK: Properties
    private let width = UIScreen.main.bounds.width
    
    //MARK: UIComponents
    private let naviView = UIView()
    
    private let friendLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.FriendTab.topBarTitle
        label.font = .AppleSDGothicNeoSemiBold(ofSize: 22)
        return label
    }()
    
    private let settingButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.FriendTab.settingButton, for: .normal)
        return button
    }()
    
    private let profileButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.FriendTab.profileImage, for: .normal)
        return button
    }()

    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setAddTarget()
        setLayout()
    }
}

extension FriendViewController {
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setAddTarget() {
        profileButton.addTarget(self, action: #selector(presentProfile), for: .touchUpInside)
    }
    
    private func setLayout() {
        view.addSubViews(naviView, profileButton)
        naviView.addSubViews(friendLabel, settingButton)
        
        naviView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(width * (52/width))
        }
        
        friendLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(14)
        }
        
        settingButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(friendLabel.snp.trailing).offset(4)
        }
        
        profileButton.snp.makeConstraints { make in
            make.top.equalTo(naviView.snp.bottom).offset(15)
            make.leading.equalToSuperview().inset(14)
        }
    }
    
    @objc
    private func presentProfile() {
        let profileVC = ProfileViewController()
        profileVC.modalPresentationStyle = .overFullScreen
        self.present(profileVC, animated: true)
    }
    
}
