//
//  NSObject+.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/12/04.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
