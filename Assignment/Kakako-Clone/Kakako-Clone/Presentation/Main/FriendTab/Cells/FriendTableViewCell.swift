//
//  FriendTableViewCell.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/11/01.
//

import UIKit

import SnapKit
import Then

class FriendTableViewCell: UITableViewCell, UITableViewRegisterable {
    //MARK: Properties
    static var isFromNib: Bool = false
    
    //MARK: UIComponents
    private let profileImageView = UIImageView()
    private let userNameLabel = UILabel()
    private let statusMessageLabel = UILabel()
    
    //MARK: View Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        profileImageView.image = ImageLiterals.FriendTab.profileImage
        profileImageView.snp.makeConstraints{
            $0.size.equalTo(40)
        }
        userNameLabel.text = "김솝트"
        statusMessageLabel.text = nil
    }
}

extension FriendTableViewCell {
    private func setUI() {
        userNameLabel.do {
            $0.font = .AppleSDGothicNeoSemiBold(ofSize: 12)
            $0.textColor = .black
        }
        
        statusMessageLabel.do {
            $0.font = .AppleSDGothicNeoRegular(ofSize: 11)
            $0.textColor = .kakaoGray
        }
    }
    
    private func setLayout() {
        contentView.addSubViews(profileImageView, userNameLabel, statusMessageLabel)
        
        profileImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }
        
        userNameLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(11)
        }
        
        statusMessageLabel.snp.makeConstraints{
            $0.top.equalTo(userNameLabel.snp.bottom).offset(3)
            $0.leading.equalTo(userNameLabel.snp.leading)
        }
    }
    
    func dataBind(_ model: UserModel) {
        profileImageView.image = model.profileImage
        userNameLabel.text = model.userName
        statusMessageLabel.text = model.statusMessage
    }
}
