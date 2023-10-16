//
//  Font.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/10/16.
//

import UIKit

// MARK: - 폰트 명을 열거형으로 선언

enum AppFontName: String {
    
    case regularFont = "SFProDisplay-Regular"
    case mediumFont = "SFProDisplay-Medium"
    case boldFont = "SFProDisplay-Bold"
    case thinFont = "SFProDisplay-Thin"
    case lightFont = "SFProDisplay-Light"
    
    var name: String {
        return self.rawValue
    }
}

extension UIFont {

    class func regular(size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.regularFont.rawValue, size: size)!
    }

    class func medium(size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.mediumFont.rawValue, size: size)!
    }

    class func bold(size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.boldFont.rawValue, size: size)!
    }
    
    class func light(size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.lightFont.rawValue, size: size)!
    }
    
    class func thin(size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.thinFont.rawValue, size: size)!
    }
}
