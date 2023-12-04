//
//  HourCollectionViewCell.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/11/09.
//

import UIKit

import Then
import SnapKit

// MARK: - 시간 별 날씨 Horizontal CollectionView Cell

final class HourCollectionViewCell: UICollectionViewCell {
    
    // MARK: - set Properties
    
    private var timeLabel = UILabel()
    private var weatherImage = UIImageView()
    private var tempLabel = UILabel()
    
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierachy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - set UI
    
    private func setUI() {
        timeLabel.do {
            $0.font = .medium(size: 17)
            $0.textColor = .white
            $0.textAlignment = .center
        }
    }
    
    
    // MARK: - set Hierachy
    
    private func setHierachy() {
        [timeLabel, weatherImage, tempLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    
    // MARK: - set Layout
    
    private func setLayout() {
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
