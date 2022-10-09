//
//  UIStackView+.swift
//  2nd_Seminar
//
//  Created by 강윤서 on 2022/10/10.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach{self.addArrangedSubview($0)}
    }
}

