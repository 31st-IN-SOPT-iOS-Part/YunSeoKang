//
//  InputView.swift
//  4th_Seminar
//
//  Created by 강윤서 on 2022/11/05.
//

import Foundation

import SnapKit
import Then
import UIKit

// MARK: - InputView

final class InputView: UIView {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 15, weight: .medium)
    }
    
    private let inputTextField = UITextField().then {
        $0.backgroundColor = .systemGray6
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 18, weight: .medium)
        $0.autocorrectionType = .no
        $0.autocapitalizationType = .none
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// MARK: - Extensions

extension InputView {
    
    // MARK: - Layout Helpers
    
    private func layout() {
        backgroundColor = .clear
        [titleLabel, inputTextField].forEach {
            self.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        inputTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(32)
        }
    }
    
    // MARK: - General Helpers
    
    func config(title: String, placeholder: String) {
        titleLabel.text = title
        inputTextField.placeholder = placeholder
    }
    
    func popInput() -> String? {
        return inputTextField.text
    }
}
