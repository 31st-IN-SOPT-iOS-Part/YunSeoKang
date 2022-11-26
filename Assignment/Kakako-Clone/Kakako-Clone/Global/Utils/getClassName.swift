//
//  getClassName.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/11/02.
//

import UIKit

extension NSObject {
    static var className: String {
        NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
    }
    var className: String {
       NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
   }
}
