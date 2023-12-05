//
//  DayWeatherCollectionViewCell.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/11/03.
//

import UIKit

import Then
import SnapKit

// MARK: - 요일 별 날씨
final class DayWeatherCollectionViewCell: UICollectionViewCell {
   
    // MARK: - set Properties

    private let dayLabel = UILabel()
    private var topicLabel = UILabel()
    private let weatherStack = UIStackView()
    private let weatherImage = UIImageView()
    
    private let percent = UILabel()
    private let mintemperatureLabel = UILabel()
    private let tempbarImage = UIImageView()
    private let maxtemperatureLabel = UILabel()
    private let divideView = UIView()
    
    
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
    
    
    // MARK: - set UI()
    
    private func setUI() {
        dayLabel.do {
            $0.font = .regular(size: 20)
            $0.textColor = .white
        }
        
        topicLabel.do {
            $0.text = "10일간의 일기예보"
            $0.textColor = .darkGray
            $0.font = .regular(size: 19)
        }
        
        weatherStack.do {
            $0.axis = .vertical
            $0.distribution = .fillEqually
            $0.spacing = -5
        }
        
        weatherImage.do {
            $0.contentMode = .scaleAspectFit
        }
        
        percent.do {
            $0.textColor = UIColor(red: 102.0/255.0, green: 204.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            $0.font = .medium(size: 12)
        }
        
        mintemperatureLabel.do {
            $0.font = .regular(size: 19)
            $0.textColor = .systemGray2
        }
        
        tempbarImage.do {
            $0.contentMode = .scaleAspectFit
        }
        
        maxtemperatureLabel.do {
            $0.font = .regular(size: 19)
            $0.textColor = .white
        }
        
        divideView.do {
            $0.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        }
    }
    
    
    // MARK: - set Hierachy
    
    private func setHierachy() {
        [weatherImage, percent].forEach {
            weatherStack.addArrangedSubview($0)
        }
        
        [dayLabel, weatherStack, mintemperatureLabel, tempbarImage, maxtemperatureLabel, divideView].forEach {
            self.contentView.addSubview($0)
        }
    }
    
    
    // MARK: - set Layout
    
    private func setLayout() {
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
