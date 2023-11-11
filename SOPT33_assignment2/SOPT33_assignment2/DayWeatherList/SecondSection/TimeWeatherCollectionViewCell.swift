//
//  TimeWeatherCollectionViewCell.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/11/06.
//

import UIKit
import SnapKit

final class TimeWeatherCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "TimeWeatherCollectionViewCell"
    
    private var timeLabel : UILabel = {
        let label = UILabel()
        label.font = .medium(size: 17)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    
    private var weatherImage = UIImageView()
    private var tempLabel : UILabel = {
        let label = UILabel()
        label.font = .medium(size: 20)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    

    private let detailCollecitonView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize =
        CGSize(width: (UIScreen.main.bounds.width - 30)/4, height: (UIScreen.main.bounds.height - 6)/5)
        flowLayout.minimumLineSpacing = 5
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return collectionView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.layer.cornerRadius = 20
        self.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2).cgColor
        self.layer.borderWidth = 0.5
        
        self.detailCollecitonView.register(HourCollectionViewCell.self, forCellWithReuseIdentifier: HourCollectionViewCell.identifier)
  
        self.detailCollecitonView.backgroundColor = .clear
        self.detailCollecitonView.delegate = self
        self.detailCollecitonView.dataSource = self
        self.setcollectionLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setcollectionLayout() {
        self.contentView.addSubview(detailCollecitonView)
        detailCollecitonView.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.leading.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview()
        }
    }
    
    func bindData(data: TimeWeatherListData) {
        self.timeLabel.text = data.time
        self.weatherImage.image = UIImage(systemName: data.weatherImage)?.withRenderingMode(.alwaysOriginal)
        self.tempLabel.text = data.temperature
    }
}

extension TimeWeatherCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 55, height: 120)
    }
}


extension TimeWeatherCollectionViewCell: UICollectionViewDelegate {}
extension TimeWeatherCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TimeweatherList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: HourCollectionViewCell.identifier,for: indexPath) as? HourCollectionViewCell else {return UICollectionViewCell()}
        item.bindData(data: TimeweatherList[indexPath.row])
        return item
    }
}
