//
//  CustomFooterView.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/11/10.
//

import UIKit

// MARK: - 3번째 section(요일 별 날씨)의 footerView

final class CustomFooterView: UICollectionReusableView {

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
