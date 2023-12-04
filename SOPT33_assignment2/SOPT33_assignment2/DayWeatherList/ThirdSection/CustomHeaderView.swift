//
//  CustomHeaderView.swift
//  SOPT33_assignment2
//
//  Created by 몰입가현 on 2023/11/09.
//

import UIKit
import Then
import SnapKit

// 3번째 section(요일 별 날씨)의 headerView
class CustomHeaderView: UICollectionReusableView {


    let midLabel : UILabel = {
        let label = UILabel()
//        label.text = "비하와 비난과 질타를 멈춰주세요 "
        label.text = "10일간의 일기예보"
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
