//
//  CGFloat+.swift
//  2nd_Seminar
//
//  Created by 강윤서 on 2022/10/10.
//

import UIKit

extension Int {
    var adjusted: Int {
        let ratio: Int = Int(UIScreen.main.bounds.width) / 375
        let ratioH: Int = Int(UIScreen.main.bounds.height) / 667
        return ratio <= ratioH ? self * ratio : self * ratioH
    }
}
