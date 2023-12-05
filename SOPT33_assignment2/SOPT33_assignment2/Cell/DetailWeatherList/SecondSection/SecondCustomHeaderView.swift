//
//  SecondCustomHeaderView.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/11/10.
//

import UIKit

import SnapKit
import Then

// MARK: - 2번째 section(시간 별 날씨)의 headerView

final class SecondCustomHeaderView: UICollectionReusableView {

    // MARK: - set Properties
    
    private var descriptLabel = UILabel()

    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure() {
        setUI()
        setHierachy()
        setLayout()
    }
    
    // MARK: - set UI
    
    private func setUI() {
        backgroundColor = .clear
        
        descriptLabel.do {
            $0.text = "08:00~09:00에 강우 상태가, 18:00에 한\n때 흐린 상태가 예상됩니다. "
            $0.numberOfLines = 2
            $0.textColor = .white
            $0.font = .regular(size: 17)
        }
    }
    
    
    // MARK: - set Hierachy
    
    private func setHierachy() {
        addSubview(descriptLabel)
    }
    
    
    // MARK: - set Layout
    
    private func setLayout() {
        descriptLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(40)
            $0.leading.equalToSuperview().inset(50)
        }
    }
}
