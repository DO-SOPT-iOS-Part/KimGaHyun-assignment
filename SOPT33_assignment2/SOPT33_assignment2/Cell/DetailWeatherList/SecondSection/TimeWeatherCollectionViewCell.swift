//
//  TimeWeatherCollectionViewCell.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/11/06.
//

import UIKit

import SnapKit
import Then

// MARK: - 시간 별 날씨

final class TimeWeatherCollectionViewCell: UICollectionViewCell {
    
    // MARK: - set Properties
    
    private var timeLabel = UILabel()
    private var weatherImage = UIImageView()
    private var tempLabel = UILabel()

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
    
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierachy()
        setLayout()
        
        setDelegate()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - set UI
    
    private func setUI() {
        detailCollecitonView.backgroundColor = .clear
        
        timeLabel.do {
            $0.font = .medium(size: 17)
            $0.textColor = .white
            $0.textAlignment = .center
        }
        
        tempLabel.do {
            $0.font = .medium(size: 20)
            $0.textColor = .white
            $0.textAlignment = .center
        }
        
        self.layer.cornerRadius = 20
        self.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2).cgColor
        self.layer.borderWidth = 0.5
    }
    
    
    // MARK: - set Hierachy
    
    private func setHierachy() {
        contentView.addSubview(detailCollecitonView)
    }
    
    
    // MARK: - set Layout
    
    private func setLayout() {
        detailCollecitonView.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.leading.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview()
        }
    }
    
    
    // MARK: - set Delegate
    
    private func setDelegate() {
        self.detailCollecitonView.delegate = self
        self.detailCollecitonView.dataSource = self
    }
    
    
    // MARK: - set CollectionView
    
    private func setupCollectionView() {
        self.detailCollecitonView.register(HourCollectionViewCell.self, forCellWithReuseIdentifier: HourCollectionViewCell.className)
    }
    
    
    func bindData(data: TimeWeatherListData) {
        self.timeLabel.text = data.time
        self.weatherImage.image = UIImage(systemName: data.weatherImage)?.withRenderingMode(.alwaysOriginal)
        self.tempLabel.text = data.temperature
    }
}

// CollectionViewCell 크기 설정
extension TimeWeatherCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 55, height: 120)
    }
}


extension TimeWeatherCollectionViewCell: UICollectionViewDelegate {}
extension TimeWeatherCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TimeweatherList.count    //Data의 갯수 == Horizontal CollectionView Cell 갯수
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: HourCollectionViewCell.className,for: indexPath) as? HourCollectionViewCell else {return UICollectionViewCell()}
        item.bindData(data: TimeweatherList[indexPath.row])
        return item
    }
}
