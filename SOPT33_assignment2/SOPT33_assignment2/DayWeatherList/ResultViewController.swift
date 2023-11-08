//
//  ResultViewController.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/10/16.
//
import UIKit
import SnapKit

class ResultViewController: UIViewController {
    private var contentView = UIImageView()
    
    private var backgroundView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "background")
        return imageView
    }()
    
    private let bottomdivideView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        return view
    }()
    
    //하단
    private var mapImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "map")
        imageView.tintColor = UIColor(named: "yellow")
        return imageView
    }()
    
    private var currentImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "current")
        return imageView
    }()
    
    private var dotImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "other")
        return imageView
    }()
    
    private lazy var menuButton : UIButton = {
        let button  = UIButton()
        button.setImage(UIImage(named: "pre"), for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    private var bottomStackView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.backgroundColor = .clear
        stackview.isUserInteractionEnabled = true
        stackview.spacing = 10
        return stackview
    }()
    
    private let detailCollecitonView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 30) , height: (UIScreen.main.bounds.height - 6) / 3)
        flowLayout.minimumLineSpacing = 5
        flowLayout.minimumInteritemSpacing = 5
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        bottomLayout()
        setcollectionLayout()

        self.navigationController?.navigationBar.isHidden = false
        
        self.detailCollecitonView.register(TopCollectionViewCell.self, forCellWithReuseIdentifier: TopCollectionViewCell.identifier)
        
        self.detailCollecitonView.register(TimeWeatherCollectionViewCell.self, forCellWithReuseIdentifier: TimeWeatherCollectionViewCell.identifier)
        
        self.detailCollecitonView.register(DayWeatherCollectionViewCell.self, forCellWithReuseIdentifier: DayWeatherCollectionViewCell.identifier)
        
        self.detailCollecitonView.delegate = self
        self.detailCollecitonView.dataSource = self
        
        
    }
    
    @objc func buttonPressed() {
        print("BUTTON PRESSED")
        navigationController?.popViewController(animated: true)
    }
    
    //기본 레이아웃
    private func setLayout() {
        view.addSubview(backgroundView)
        view.addSubview(contentView)
        contentView.backgroundColor = .clear
        
        backgroundView.snp.makeConstraints {
            $0.centerX.centerY.width.height.equalToSuperview()
        }
        
        
        contentView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.width.equalTo(view)
            $0.height.greaterThanOrEqualTo(view).priority(.high) //?
            
        }
    }
    
    
    private func setcollectionLayout() {
        self.view.addSubview(detailCollecitonView)
        detailCollecitonView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(bottomdivideView.snp.top)
        }
    }
    
    
    //하단 바
    private func bottomLayout() {
        view.addSubview(bottomdivideView)
        view.addSubview(bottomStackView)
        bottomStackView.addArrangeSubViews(currentImage, dotImage)
        view.addSubview(mapImage)
        view.addSubview(menuButton)
        
        [bottomdivideView, bottomStackView, mapImage, currentImage, dotImage, menuButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        bottomdivideView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(UIScreen.main.bounds.height-100)
            $0.height.equalTo(0.5)
            $0.width.equalTo(UIScreen.main.bounds.width)
        }
        
        
        NSLayoutConstraint.activate([
            bottomStackView.topAnchor.constraint(equalTo: bottomdivideView.bottomAnchor, constant: 10),
            bottomStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            mapImage.topAnchor.constraint(equalTo: bottomdivideView.bottomAnchor, constant: 2),
            mapImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            menuButton.topAnchor.constraint(equalTo: bottomdivideView.bottomAnchor, constant: 2),
            menuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
}

extension UIStackView {
    func addArrangeSubViews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}


extension ResultViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0 :
            return CGSize(width: 375, height: 212)
        case 1:
            return CGSize(width: 335, height: 212)
        case 2:
            return CGSize(width: 335, height: 44)
        default:
            return CGSize(width: 0.0, height: 0.0)
        }
    }
}

extension ResultViewController: UICollectionViewDelegate {}
extension ResultViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return 1
        case 1 :
            return 1
        case 2:
            return DayweatherList.count
        default :
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier:  TopCollectionViewCell.identifier,for: indexPath) as? TopCollectionViewCell else {return UICollectionViewCell()}
            return item
        }
        else if indexPath.section == 1 {
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: TimeWeatherCollectionViewCell.identifier,for: indexPath) as? TimeWeatherCollectionViewCell else {return UICollectionViewCell()}
            item.bindData(data: TimeweatherList[indexPath.row])
            return item
        }
        else {
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: DayWeatherCollectionViewCell.identifier,for: indexPath) as? DayWeatherCollectionViewCell else {return UICollectionViewCell()}
            item.bindData(data: DayweatherList[indexPath.row])
            return item
            
        }
        //        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: DayWeatherCollectionViewCell.identifier,
        //                                                            for: indexPath) as? DayWeatherCollectionViewCell else {return UICollectionViewCell()}
        //item.bindData(data: DayweatherList[indexPath.row])
        
    }
}
