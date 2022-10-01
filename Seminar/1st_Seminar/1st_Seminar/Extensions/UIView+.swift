//
//  UIView+.swift
//  1st_Seminar
//
//  Created by 강윤서 on 2022/10/01.
//

import UIKit

extension UIView {
    // UIView 여러 개 인자로 받아서 한 번에 addSubview
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
