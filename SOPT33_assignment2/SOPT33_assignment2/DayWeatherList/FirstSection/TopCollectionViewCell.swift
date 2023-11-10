//
//  TopCollectionViewCell.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/11/06.
//

import UIKit

class TopCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "TopCollectionViewCell"
    
    private var locationLabel = UILabel()
    private var tempLabel = UILabel()
    private var weatherLabel = UILabel()
    private var maxminLabel = UILabel()
    
    
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
        
        setFont(label: locationLabel, fonttype: "SFProDisplay-Regular", size: 35, text: "의정부시")
        setFont(label: tempLabel, fonttype: "SFProDisplay-Thin", size: 90, text: "21º")
        setFont(label: weatherLabel, fonttype: "SFProDisplay-Regular", size: 25, text: "흐림")
        setFont(label: maxminLabel, fonttype: "SFProDisplay-Regular", size: 20, text: "최고:29º 최저:25º")
        

        
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
    
}
