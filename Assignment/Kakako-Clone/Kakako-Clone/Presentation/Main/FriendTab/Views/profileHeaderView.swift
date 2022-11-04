//
//  profileHeaderView.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/11/04.
//

import UIKit

import Then
import SnapKit

class profileHeaderView: BaseView {
    //MARK: UIComponents
    private let profileImageView = UIImageView()
    private let userNameLabel = UILabel()
    private let statusMessageLabel = UILabel()
    
    override func setUI() {
        profileImageView.do {
            $0.image = ImageLiterals.FriendTab.profileImage
        }
        
        userNameLabel.do {
            $0.text = "윤돌이"
            $0.font = .AppleSDGothicNeoSemiBold(ofSize: 16)
            $0.textColor = .black
        }
        
        statusMessageLabel.do {
            $0.text = "하암,,,"
            $0.font = .AppleSDGothicNeoRegular(ofSize: 11)
            $0.textColor = .kakaoGray
        }
    }
    
    override func setLayout() {
        self.addSubViews(profileImageView, userNameLabel, statusMessageLabel)
        
        profileImageView.snp.makeConstraints{
            $0.size.equalTo(58)
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview().inset(8)
        }
        
        userNameLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(19)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(11)
        }
        
        statusMessageLabel.snp.makeConstraints{
            $0.top.equalTo(userNameLabel.snp.bottom).offset(6)
            $0.leading.equalTo(userNameLabel.snp.leading)
        }
    }

}
