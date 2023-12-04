//
//  DayWeatherCollectionViewCell.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/11/03.
//

import UIKit
import Then
import SnapKit

//요일 별 날씨
class DayWeatherCollectionViewCell: UICollectionViewCell {
   

    private let dayLabel = UILabel().then {
        $0.font = .regular(size: 20)
        $0.textColor = .white
    }
    
    private var topicLabel : UILabel = {
        let label = UILabel()
        label.text = "10일간의 일기예보"
        label.textColor = .darkGray
        label.font = .regular(size: 19)
        return label
    }()
    
    private let weatherStack = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = -5
    }
    
    private let weatherImage = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }

    //강수량 표시
    private let percent = UILabel().then {
        $0.textColor =  UIColor(red: 102.0/255.0, green: 204.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        $0.font = .medium(size: 12)
    }
    
    private let mintemperatureLabel = UILabel().then {
        $0.font = .regular(size: 19)
        $0.textColor = .systemGray2
    }
    
    private let tempbarImage = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    
    private let maxtemperatureLabel = UILabel().then {
        $0.font = .regular(size: 19)
        $0.textColor = .white
    }
    
    private let divideView = UIView().then {
        $0.backgroundColor = UIColor.white.withAlphaComponent(0.1)
    }
    


    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    private func setLayout() {
        [weatherImage, percent].forEach {
            weatherStack.addArrangedSubview($0)
        }
        
        [dayLabel, weatherStack, mintemperatureLabel, tempbarImage, maxtemperatureLabel, divideView].forEach {
            self.contentView.addSubview($0)
        }
        
        dayLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalTo(contentView.snp.leading).inset(20)
            $0.centerY.equalToSuperview()
        }
    
        
        weatherStack.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalTo(contentView.snp.leading).offset(70)
        }
        
        mintemperatureLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalTo(contentView.snp.leading).offset(120)
            $0.centerY.equalToSuperview()
        }
        tempbarImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.width.equalTo(108)
            $0.height.equalTo(10)
            $0.leading.equalTo(mintemperatureLabel.snp.trailing).offset(20)
            

        }
        maxtemperatureLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalTo(tempbarImage.snp.trailing).offset(20)
            $0.bottom.equalTo(contentView.snp.bottom)
            $0.centerY.equalToSuperview()

        }
        
        divideView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.bottom).inset(1)
            $0.bottom.equalTo(contentView.snp.bottom)
            $0.width.equalTo(contentView.snp.width)
            
        }
    }
    
    func bindData(data: DayWeatherListData) {
        self.dayLabel.text = data.day
        self.weatherImage.image = UIImage(systemName: data.weatherimg)?.withRenderingMode(.alwaysOriginal)
        self.percent.text = data.percent
        self.mintemperatureLabel.text = data.mintemperature
        self.tempbarImage.image = UIImage(named: data.tempbar)
        self.maxtemperatureLabel.text = data.maxtemperature
    }
}
