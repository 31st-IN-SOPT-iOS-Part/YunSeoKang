//
//  adjust+.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/10/13.
//

import UIKit

extension CGFloat {
    var adjusted: CGFloat {
        let ratio: CGFloat = UIScreen.main.bounds.width / 375
        let ratioH: CGFloat = UIScreen.main.bounds.height / 667
        return ratio <= ratioH ? self * ratio : self * ratioH
    }
}

extension Int {
    var adjusted: CGFloat {
        let ratio: CGFloat = (UIScreen.main.bounds.width) / 375
        let ratioH: CGFloat = (UIScreen.main.bounds.height) / 667
        return ratio <= ratioH ? CGFloat(self) * ratio : CGFloat(self) * ratioH
    }
}

extension Double {
    var adjusted: CGFloat {
        let ratio: CGFloat = (UIScreen.main.bounds.width) / 375
        let ratioH: CGFloat = (UIScreen.main.bounds.height) / 667
        return ratio <= ratioH ? CGFloat(self) * ratio : CGFloat(self) * ratioH
    }
}
