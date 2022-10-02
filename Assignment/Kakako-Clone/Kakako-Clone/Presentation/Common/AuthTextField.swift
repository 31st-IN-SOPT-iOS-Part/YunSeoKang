//
//  AuthTextField.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/10/02.
//

import UIKit

class AuthTextField: UITextField {
    
    //MARK: UI Components
    private var underLineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = .systemGray4
        return lineView
    }()
    
    //MARK: Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Extension
extension AuthTextField {
    private func setUI() {
        self.textColor = .black
        self.font = .systemFont(ofSize: 17, weight: .regular)
        self.clearButtonMode = .whileEditing
    }
    
    private func setLayout() {
        addSubview(underLineView)
        
        underLineView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
    }
}
