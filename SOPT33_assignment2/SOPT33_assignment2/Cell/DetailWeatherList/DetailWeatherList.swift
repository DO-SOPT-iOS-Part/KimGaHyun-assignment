//
//  DetailWeatherList.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/12/06.
//

import UIKit

import UIKit
import SnapKit

final class DetailWeatherListView: UIView {
    
    // MARK: - Properties
    
    private var contentView = UIImageView()
    private var backgroundView = UIImageView()
    private let bottomdivideView = UIView()
    private var mapImage = UIImageView()
    private var currentImage = UIImageView()
    private var dotImage = UIImageView()
    lazy var menuButton = UIButton()
    private var bottomStackView = UIStackView()
    
    lazy var detailCollecitonView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 30), height: (UIScreen.main.bounds.height - 6) / 3)
        flowLayout.minimumLineSpacing = 5
        flowLayout.minimumInteritemSpacing = 5
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return collectionView
    }()
    
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    
    func configure() {
        setUI()
        setHierarchy()
        setLayout()
    }
    
    
    // MARK: - set UI
    
    func setUI() {
        contentView.backgroundColor = .clear
        detailCollecitonView.backgroundColor = .clear
        
        backgroundView.do {
            $0.image = #imageLiteral(resourceName: "background")
        }
        
        bottomdivideView.do {
            $0.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        }
        
        mapImage.do {
            $0.image = #imageLiteral(resourceName: "map" )
        }
        
        currentImage.do {
            $0.image = #imageLiteral(resourceName: "current")
        }
        
        dotImage.do {
            $0.image = #imageLiteral(resourceName: "other")
        }
        
        menuButton.do {
            $0.setImage(UIImage(named: "pre"), for: .normal)
        }
        
        bottomStackView.do {
            $0.axis = .horizontal
            $0.backgroundColor = .clear
            $0.isUserInteractionEnabled = true
            $0.spacing = 10
        }
    }
    
    
    // MARK: - set Hierarchy
    
    private func setHierarchy() {
        
        addSubviews(backgroundView,
                    contentView,
                    detailCollecitonView,
                    bottomdivideView,
                    bottomStackView)
        
        
        bottomStackView.addArrangedSubviews(currentImage,
                                            dotImage)
        
        addSubviews(mapImage,
                    menuButton)
        
    }
    
    // MARK: - set Layout
    
    private func setLayout() {
        backgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.greaterThanOrEqualTo(self).priority(.high) //?
        }
        
        detailCollecitonView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(bottomdivideView.snp.top)
        }
        
        bottomdivideView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(UIScreen.main.bounds.height-100)
            $0.height.equalTo(0.5)
            $0.width.equalTo(UIScreen.main.bounds.width)
        }
        
        bottomStackView.snp.makeConstraints {
            $0.top.equalTo(bottomdivideView.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        mapImage.snp.makeConstraints {
            $0.top.equalTo(bottomdivideView.snp.bottom).offset(2)
            $0.leading.equalTo(self.snp.leading).offset(10)
        }
        menuButton.snp.makeConstraints {
            $0.top.equalTo(bottomdivideView.snp.bottom).offset(2)
            $0.trailing.equalTo(self.snp.trailing).inset(20)
        }
    }
}
