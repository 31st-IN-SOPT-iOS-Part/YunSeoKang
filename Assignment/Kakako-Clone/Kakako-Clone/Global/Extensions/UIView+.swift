//
//  UIView+.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/10/01.
//

import UIKit

extension UIView {
    func addSubViews(_ views: UIView...) {
        views.forEach{self.addSubview($0)}
    }
}
