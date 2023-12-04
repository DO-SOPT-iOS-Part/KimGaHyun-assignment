//
//  HourCollectionViewCell.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/11/09.
//

import UIKit
import Then
import SnapKit

// 시간 별  날씨 - Horizontal CollectionView Cell
class HourCollectionViewCell: UICollectionViewCell {
    
    private var timeLabel : UILabel = {
        let label = UILabel()
        label.font = .medium(size: 17)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    private var weatherImage = UIImageView()
    private var tempLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        [timeLabel, weatherImage, tempLabel].forEach {
            contentView.addSubview($0)
        }
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).inset(20)
        }
        
        weatherImage.snp.makeConstraints {
            $0.top.equalTo(timeLabel.snp.bottom).offset(20)
            
        }
        tempLabel.snp.makeConstraints {
            $0.top.equalTo(weatherImage.snp.bottom).offset(20)
        }
        
    }
    
    
    func bindData(data: TimeWeatherListData) {
        self.timeLabel.text = data.time
        self.weatherImage.image = UIImage(systemName: data.weatherImage)?.withRenderingMode(.alwaysOriginal)
        self.tempLabel.text = data.temperature
        
    }
}

