//
//  TopCollectionViewCell.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/11/06.


import UIKit

import Then
import SnapKit

final class TopCollectionViewCell: UICollectionViewCell {
    
    // MARK: - set Properties
    
    private var locationLabel = UILabel()
    private var tempLabel = UILabel()
    private var weatherLabel = UILabel()
    private var maxminLabel = UILabel()
    
    
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
        locationLabel.do {
            $0.font = .regular(size: 35)
        }
        
        tempLabel.do {
            $0.font = .thin(size: 90)
        }
        
        weatherLabel.do {
            $0.font = .regular(size: 25)
        }
        
        maxminLabel.do {
            $0.font = .regular(size: 20)
        }
        
        [locationLabel, tempLabel, weatherLabel, maxminLabel].forEach {
            $0.textColor = .white
            $0.backgroundColor = .clear
            $0.textAlignment = .center
        }
    }
    
    
    // MARK: - set Hierachy
    
    private func setHierachy() {
        contentView.addSubviews(locationLabel,
                                tempLabel,
                                weatherLabel,
                                maxminLabel)
    }
    
    
    // MARK: - set Layout
        
    private func setLayout() {
        [locationLabel, tempLabel, weatherLabel, maxminLabel].forEach {
            $0.snp.makeConstraints {
                $0.leading.equalTo(contentView.snp.leading)
                $0.trailing.equalTo(contentView.snp.trailing)
            }
        }
        locationLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top)
        }
        
        tempLabel.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.bottom).inset(5)
        }
        weatherLabel.snp.makeConstraints {
            $0.top.equalTo(tempLabel.snp.bottom).inset(5)
        }
        maxminLabel.snp.makeConstraints {
            $0.top.equalTo(weatherLabel.snp.bottom).offset(5)
        }
    }
    
    func setFont(label: UILabel, fonttype: String, size: CGFloat, text: String) {
        label.font = UIFont(name: fonttype, size: size)
        label.text = text
    }
    
    func bindData(data: WeatherListData) {
        self.locationLabel.text = data.location
        self.tempLabel.text = String(data.temperature) + "º"
        self.weatherLabel.text = data.weather
        self.maxminLabel.text = "최고 : " + String(data.max) + "º " + " 최저 : " + String(data.min) + "º"
    }
}
