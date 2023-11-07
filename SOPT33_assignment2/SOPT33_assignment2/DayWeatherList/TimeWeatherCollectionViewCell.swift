//
//  TimeWeatherCollectionViewCell.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/11/06.
//

import UIKit

class TimeWeatherCollectionViewCell: UICollectionViewCell {
    
    
    static let identifier: String = "TimeWeatherCollectionViewCell"
    private var verticalStackView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.spacing = 10
        stackview.distribution = .equalCentering
        return stackview
    }()
    
    private var descriptLabel : UILabel = {
        let label = UILabel()
        label.text = "08:00~09:00에 강우 상태가, 18:00에 한\n때 흐린 상태가 예상됩니다. "
        label.numberOfLines = 2
        label.textColor = .white
        label.font = .regular(size: 19)
        return label
    }()
    
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
        self.setLayout()
        self.layer.cornerRadius = 20
        self.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2).cgColor
        self.layer.borderWidth = 0.5

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setLayout() {
//        contentView.addSubview(verticalStackView)
//
//        [timeLabel, weatherImage, tempLabel].forEach {
//            self.verticalStackView.addArrangedSubview($0)
//        }
//
        
        [timeLabel, weatherImage, tempLabel].forEach {
            self.contentView.addSubview($0)
        }

//
//        verticalStackView.snp.makeConstraints {
//            $0.top.equalTo(contentView.snp.top).inset(5)
//            $0.leading.equalTo(contentView.snp.leading).inset(5)
//
//        }
//
        

        timeLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).inset(20)
            $0.leading.equalTo(contentView.snp.leading).offset(20)
//            $0.leading.equalToSuperview().inset(10)
        }

        weatherImage.snp.makeConstraints {
            $0.top.equalTo(timeLabel.snp.bottom).offset(10)
            $0.leading.equalTo(timeLabel.snp.leading)
        }

        tempLabel.snp.makeConstraints {
            $0.top.equalTo(weatherImage.snp.bottom).offset(10)
            $0.leading.equalTo(weatherImage.snp.leading)

        }
        
    }
    
    func bindData(data: TimeWeatherListData) {
        self.timeLabel.text = data.time
        self.weatherImage.image = UIImage(systemName: data.weatherImage)?.withRenderingMode(.alwaysOriginal)
        self.tempLabel.text = data.temperature
    }
}



