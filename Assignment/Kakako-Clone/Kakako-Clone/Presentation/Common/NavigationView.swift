//
//  NavigationView.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/11/04.
//

import UIKit

import SnapKit
import Then

class NavigationView: UIView {

    public enum ViewType {
        case FriendTab
        case ChatTab
    }

    private let friendTabLabel = UILabel()
    private let settingButton = UIButton()
    private var chattingButton = UIButton()
    private var openChatButton = UIButton()
    private var plusButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NavigationView {
    private func setLayout() {
    }
    
    private func setUI() {
        
    }
}
