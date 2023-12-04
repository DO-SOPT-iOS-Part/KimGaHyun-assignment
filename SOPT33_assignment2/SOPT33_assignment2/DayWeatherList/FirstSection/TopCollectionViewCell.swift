//
//  TopCollectionViewCell.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/11/06.


import UIKit

import Then
import SnapKit

class TopCollectionViewCell: UICollectionViewCell {
    
    
    private var locationLabel = UILabel().then {
        $0.font = .regular(size: 35)
    }
    
    private var tempLabel = UILabel().then {
        $0.font = .thin(size: 90)
    }
    
    private var weatherLabel = UILabel().then {
        $0.font = .regular(size: 25)
    }
    private var maxminLabel = UILabel().then {
        $0.font = .regular(size: 20)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setLayout() {
        
        [locationLabel, tempLabel, weatherLabel, maxminLabel].forEach {
            contentView.addSubview($0)
            
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.textColor = .white
            $0.backgroundColor = .clear
            $0.textAlignment = .center
            NSLayoutConstraint.activate([
                $0.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                $0.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            ])
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
    
    func setFont(label: UILabel, fonttype: String, size: CGFloat, text: String){
        label.font = UIFont(name: fonttype, size: size)
        label.text = text
    }
    
    func bindData(data: WeatherListData) {
        self.locationLabel.text = data.location
        self.tempLabel.text = String(data.temperature) + "º"
        self.weatherLabel.text = data.weather
        self.maxminLabel.text = "최고:" + String(data.max) + "º " + " 최저:" + String(data.min) + "º"
    }
    
}
