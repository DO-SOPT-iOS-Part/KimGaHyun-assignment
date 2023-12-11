//
//  UIImage+.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/12/12.
//

import UIKit

extension UIImage {
    static func load(named imageName: String) -> UIImage {
        guard let image = UIImage(named: imageName, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        return image
    }
}
