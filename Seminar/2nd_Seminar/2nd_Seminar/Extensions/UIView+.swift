//
//  UIView+.swift
//  2nd_Seminar
//
//  Created by 강윤서 on 2022/10/08.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
