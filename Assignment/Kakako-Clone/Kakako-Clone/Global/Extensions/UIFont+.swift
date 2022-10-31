//
//  UIFont+.swift
//  Kakako-Clone
//
//  Created by 강윤서 on 2022/10/11.
//

import UIKit

struct AppFontName {
    static let appleSDGothicNeoBold = "AppleSDGothicNeo-Bold"
    static let appleSDGothicNeoMedium = "AppleSDGothicNeo-Medium"
    static let appleSDGothicNeoRegular = "AppleSDGothicNeo-Regular"
    static let appleSDGothicNeoThin = "AppleSDGothicNeo-Thin"
    static let appleSDGothicNeoUltraLight = "AppleSDGothicNeo-UltraLight"
    static let appleSDGothicNeoLight = "AppleSDGothicNeo-Light"
    static let appleSDGothicNeoSemiBold = "AppleSDGothicNeo-SemiBold"
    
}

extension UIFontDescriptor.AttributeName {
    static let nsctFontUIUsage = UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")
}

extension UIFont {
    @objc class func AppleSDGothicNeoBold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.appleSDGothicNeoBold, size: size)!
    }
    
    @objc class func AppleSDGothicNeoMedium(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.appleSDGothicNeoMedium, size: size)!
    }
    
    @objc class func AppleSDGothicNeoRegular(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.appleSDGothicNeoRegular, size: size)!
    }
    
    @objc class func AppleSDGothicNeoThin(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.appleSDGothicNeoThin, size: size)!
    }
    
    @objc class func AppleSDGothicNeoUltraLight(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.appleSDGothicNeoUltraLight, size: size)!
    }
    
    @objc class func AppleSDGothicNeoLight(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.appleSDGothicNeoLight, size: size)!
    }
    
    @objc class func AppleSDGothicNeoSemiBold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.appleSDGothicNeoSemiBold, size: size)!
    }
}


