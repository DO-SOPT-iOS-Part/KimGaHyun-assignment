//
//  UIStackView+.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/12/04.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
