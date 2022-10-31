//
//  AuthButton.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/10/02.
//

import UIKit

class AuthButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Extension
extension AuthButton {
    private func setUI() {
        self.setTitleColor(UIColor.black, for: .normal)
        self.backgroundColor = .systemGray6
        self.layer.cornerRadius = 4
        self.isEnabled = false
        self.titleLabel?.font = .AppleSDGothicNeoMedium(ofSize: 15)
    }
}
