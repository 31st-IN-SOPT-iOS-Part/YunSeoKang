//
//  ChatCollectionViewCell.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/11/04.
//

import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa

class ChatCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    //MARK: Properties
    static var isFromNib: Bool = false
    
    //MARK: UIComponents
    private let profileImageView = UIImageView()
    private let userNameLabel = UILabel()
    private let recentChatLabel = UILabel()
    private let timeLabel = UILabel()
    
    //MARK: View Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ChatCollectionViewCell {
    private func setUI() {
        userNameLabel.do{
            $0.font = .AppleSDGothicNeoSemiBold(ofSize: 12)
            $0.textColor = .black
        }
        
        recentChatLabel.do{
            $0.font = .AppleSDGothicNeoRegular(ofSize: 11)
            $0.textColor = .kakaoGray
        }
        
        timeLabel.do {
            $0.font = .AppleSDGothicNeoRegular(ofSize: 8)
            $0.textColor = .kakaoGray
        }
    }
    
    private func setLayout() {
        contentView.addSubViews(profileImageView, userNameLabel, recentChatLabel, timeLabel)
        
        profileImageView.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }
        
        userNameLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(11)
        }
        
        recentChatLabel.snp.makeConstraints{
            $0.top.equalTo(userNameLabel.snp.bottom).offset(3)
            $0.leading.equalTo(userNameLabel.snp.leading)
        }
        
        timeLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
    
    func dataBind(_ model: ChatModel) {
        profileImageView.image = model.profileImage
        userNameLabel.text = model.userName
        recentChatLabel.text = model.recentMessage
        timeLabel.text = model.time
    }
}
