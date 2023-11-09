//
//  SecondCustomFooterView.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/11/10.
//

import UIKit

//2번째 section의 footerView
class SecondCustomFooterView: UICollectionReusableView {

    static let identifier: String = "SecondCustomFooterView"
    
    func configure() {
        backgroundColor = .clear
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
