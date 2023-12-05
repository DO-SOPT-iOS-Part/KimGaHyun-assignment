//
//  WeatherListTableViewCell.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/10/30.
//

import UIKit

import Then
import SnapKit

final class WeatherListTableViewCell: UITableViewCell {
        
    // MARK: - set Properties
    
    private let backgroundImage = UIImageView()
    private let tableView = UITableView(frame: .zero, style: .plain)
    private let mainLabel = UILabel()
    private let timeLabel = UILabel()
    private let weatherLabel = UILabel()
    private let temperatureLabel = UILabel()
    private let maxLabel = UILabel()
    private let minLabel = UILabel()
    
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setUI()
        setHierachy()
        setLayout()
    }
    
    
    // MARK: - set UI
    
    private func setUI() {
        self.backgroundView = backgroundImage
        
        backgroundImage.do {
            $0.image = UIImage(named: "list")
        }
        
        tableView.do {
            $0.backgroundColor = .clear
            $0.separatorStyle = .singleLine
        }
        
        mainLabel.do {
            $0.font = .bold(size: 23)
        }
        
        temperatureLabel.do {
            $0.font = .light(size: 53)
        }
        
        [timeLabel, weatherLabel].forEach {
            $0.font = .medium(size: 17)
        }
        
        [maxLabel, minLabel].forEach {
            $0.font = .medium(size: 16)
        }
        
        [mainLabel, timeLabel, weatherLabel, temperatureLabel, maxLabel, minLabel].forEach {
            $0.textColor = .white
        }
        
    }
    
    
    // MARK: - set Hierachy
    
    private func setHierachy() {
        contentView.addSubview(backgroundImage)

        backgroundImage.addSubviews(mainLabel,
                                    timeLabel,
                                    weatherLabel,
                                    temperatureLabel,
                                    maxLabel,
                                    minLabel)
    }
    
    
    // MARK: - set Layout
    
    private func setLayout() {
        
        backgroundImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.bottom.equalToSuperview().offset(-5)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        

        mainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(13)
        }
        
        timeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(40)
            $0.leading.equalToSuperview().inset(13)
        }
        
        weatherLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(13)
        }
        
        temperatureLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(6)
            $0.trailing.equalToSuperview().inset(15)
        }
        
        maxLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview().inset(65)
        }
        minLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(12)
            $0.leading.equalTo(maxLabel.snp.leading).offset(55)
        }
    }
    
    func bindData(data: WeatherListData) {
        self.mainLabel.text = data.location
        self.timeLabel.text = data.time
        self.weatherLabel.text = data.weather
        self.temperatureLabel.text = String(data.temperature) + "º"
        self.maxLabel.text = "최고:" + String(data.max) + "º"
        self.minLabel.text = "최저:" + String(data.min) + "º"
    }
}
