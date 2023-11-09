//
//  CustomHeaderView.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/11/09.
//

import UIKit

//3번째 section의 headerView
class CustomHeaderView: UICollectionReusableView {

    static let identifier: String = "CustomHeaderView"
    let midLabel : UILabel = {
        let label = UILabel()
        label.text = "10일간의 일기예보 "
        label.textColor = .systemGray2
        label.font = .regular(size: 15)
        return label
    }()
    
    
    func configure() {
        backgroundColor = .clear
        addSubview(midLabel)
        midLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(40)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
