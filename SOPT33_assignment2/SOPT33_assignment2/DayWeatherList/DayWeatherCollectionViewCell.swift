//
//  DayWeatherCollectionViewCell.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/11/03.
//

import UIKit

class DayWeatherCollectionViewCell: UICollectionViewCell {
   
    static let identifier: String = "DayWeatherCollectionViewCell"
    private let dayLabel = UILabel().then {
        $0.font = .regular(size: 21)
        $0.textColor = .white
    }
    
    private let weatherImage = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    private let mintemperatureLabel = UILabel().then {
        $0.font = .regular(size: 18)
        $0.textColor = .darkGray
    }
    
    private let tempbarImage = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    
    private let maxtemperatureLabel = UILabel().then {
        $0.font = .regular(size: 18)
        $0.textColor = .white
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    private func setLayout() {
        [dayLabel, weatherImage, mintemperatureLabel, tempbarImage, maxtemperatureLabel].forEach {
            self.contentView.addSubview($0)
        }
        
        dayLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(16)
        }
        
        weatherImage.snp.makeConstraints {
            $0.width.equalTo(35)
            $0.leading.equalTo(dayLabel.snp.trailing).offset(10)
        }
        
        mintemperatureLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalTo(weatherImage.snp.trailing).offset(25)
        }
        tempbarImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.width.equalTo(108)
            $0.height.equalTo(10)
            $0.leading.equalTo(mintemperatureLabel.snp.trailing).offset(5)
        }
        maxtemperatureLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalTo(tempbarImage.snp.trailing).offset(5)
        }
        
    }
    
    func bindData(data: DayWeatherListData) {
        self.dayLabel.text = data.day
        self.weatherImage.image = UIImage(named: data.weatherimg)
        self.mintemperatureLabel.text = data.mintemperature
        self.tempbarImage.image = UIImage(named: data.tempbar)
        self.maxtemperatureLabel.text = data.maxtemperature
    }
}
