//
//  SecondCustomFooterView.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/11/10.
//

import UIKit

// MARK: - 2번째 section(시간 별 날씨)의 footerView
final class SecondCustomFooterView: UICollectionReusableView {

    // MARK: - configure
    
    func configure() {
        backgroundColor = .clear
    }
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
