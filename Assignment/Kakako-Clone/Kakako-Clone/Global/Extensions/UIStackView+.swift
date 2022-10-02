//
//  UIStackView+.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/10/02.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach{self.addArrangedSubview($0)}
    }
}
