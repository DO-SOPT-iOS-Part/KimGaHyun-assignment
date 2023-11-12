//
//  WeatherListTableViewCell.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/10/30.
//

import UIKit
import Then
import SnapKit

class WeatherListTableViewCell: UITableViewCell {
    static let identifier : String = "WeatherListTableViewCell"
    
    private let backgroundImage = UIImageView().then {
        $0.image = UIImage(named: "list")
    }
    

    private let tableView = UITableView(frame: .zero, style: .plain).then {
        $0.backgroundColor = .clear
        //$0.separatorColor = .lightGray
        $0.separatorStyle = .singleLine
    }

    
    private let mainLabel = UILabel().then {
        $0.font = .bold(size: 23)
        $0.textColor = .white
    }
    
    
    private let timeLabel = UILabel().then {
        $0.font = .medium(size: 17)
        $0.textColor = .white
    }
    
    private let weatherLabel = UILabel().then {
        $0.font = .medium(size: 17)
        $0.textColor = .white
    }
    
    private let temperatureLabel = UILabel().then {
        $0.font = .light(size: 53)
        $0.textColor = .white
    }
    
    private let maxminLabel = UILabel().then {
        $0.font = .medium(size: 16)
        $0.textColor = .white
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setLayout()
    }
    
    private func setLayout() {
    
        self.backgroundView = backgroundImage

        [backgroundImage].forEach {
            self.contentView.addSubview($0)
        }
        
        backgroundImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.bottom.equalToSuperview().offset(-5)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        [mainLabel, timeLabel, weatherLabel, temperatureLabel, maxminLabel].forEach {
            self.backgroundImage.addSubview($0)
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
        
        maxminLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview().inset(15)
        }
    
        
    }
    
    func bindData(data: WeatherListData) {
        self.mainLabel.text = data.location
        self.timeLabel.text = data.time
        self.weatherLabel.text = data.weather
        self.temperatureLabel.text = data.temperature
        self.maxminLabel.text = data.maxmin
    }

}
