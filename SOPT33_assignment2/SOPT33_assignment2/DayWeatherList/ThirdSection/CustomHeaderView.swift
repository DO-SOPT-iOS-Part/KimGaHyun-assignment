//
//  CustomHeaderView.swift
//  SOPT33_assignment2
//
//  Created by 몰입가현 on 2023/11/09.
//

import UIKit

import Then
import SnapKit

// MARK: - 3번째 section(요일 별 날씨)의 headerView

final class CustomHeaderView: UICollectionReusableView {
    
    // MARK: - set Properties
    
    let midLabel = UILabel()

    func configure() {
        setUI()
        setHierachy()
        setLayout()
    }
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    // MARK: - set UI
    
    private func setUI() {
        backgroundColor = .clear
        
        midLabel.do {
            $0.text = "10일간의 일기예보"
            $0.textColor = .systemGray2
            $0.font = .regular(size: 15)
        }
    }
    
    
    // MARK: - set Hierachy
    
    private func setHierachy() {
        addSubview(midLabel)
    }
    
    
    // MARK: - set Layout
    
    private func setLayout() {
        midLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(40)
        }
    }
}
