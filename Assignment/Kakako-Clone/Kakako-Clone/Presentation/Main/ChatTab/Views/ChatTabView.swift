//
//  TalkView.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/11/02.
//

import UIKit

import SnapKit
import Then

class ChatTabView: BaseView {
    //MARK: UIComponents
    private let naviView = UIView()
    private let chatButton = UIButton()
    private let opentChatButton = UIButton()
    private let plusButton = UIButton()
    private let settingButton = UIButton()
    private let chatCollectionView = UICollectionView()
    
    override func setUI() {
        [chatButton, opentChatButton].forEach {
            $0.setTitleColor(.black, for: .selected)
            $0.setTitleColor(.kakaoGray, for: .normal)
            $0.titleLabel?.font = .AppleSDGothicNeoMedium(ofSize: 22)
        }
        
        chatButton.do {
            $0.setTitle(I18N.ChatTab.chatTitle, for: .normal)
        }
        
        opentChatButton.do {
            $0.setTitle(I18N.ChatTab.opentChatTitle, for: .normal)
        }
        
        settingButton.do {
            $0.setImage(ImageLiterals.FriendTab.settingButton, for: .normal)
        }
        
        plusButton.do {
            $0.setImage(ImageLiterals.ChatTab.plusButton, for: .normal)
        }
    }
    
    override func setLayout() {
        <#code#>
    }

}
