//
//  SecondCustomHeaderView.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/11/10.
//

import UIKit

//2번째 section의 headerView
class SecondCustomHeaderView: UICollectionReusableView {

    static let identifier: String = "SecondCustomHeaderView"
    
    //header로 뺄 거
    private var descriptLabel : UILabel = {
        let label = UILabel()
        label.text = "08:00~09:00에 강우 상태가, 18:00에 한\n때 흐린 상태가 예상됩니다. "
        label.numberOfLines = 2
        label.textColor = .white
        label.font = .regular(size: 17)
        return label
    }()
    
    func configure() {
        backgroundColor = .clear
        
        addSubview(descriptLabel)
        descriptLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(40)
            $0.leading.equalToSuperview().inset(50)
        }

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
