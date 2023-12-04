//
//  ResultViewController.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/10/16.
//
import UIKit
import SnapKit
import Then

final class ResultViewController: UIViewController {
    
    private var contentView = UIImageView()
    private var backgroundView =  UIImageView()
    private let bottomdivideView = UIView()

    private var mapImage = UIImageView()
    private var currentImage = UIImageView()
    private var dotImage = UIImageView()
    private lazy var menuButton = UIButton()
    private var bottomStackView = UIStackView()
    
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
        
        setUI()
        setHierachy()
        setLayout()
        

        setDelegate()
        setupCollectionView()

        self.navigationController?.navigationBar.isHidden = false
    }
    
    //화면 뒤로 가기
    @objc func buttonPressed() {
        print("BUTTON PRESSED")
        navigationController?.popViewController(animated: true)
    }
    
    private func setUI() {
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
            $0.tintColor = UIColor(named: "yellow")
        }
        
        currentImage.do {
            $0.image = #imageLiteral(resourceName: "current")
        }
        
        dotImage.do {
            $0.image = #imageLiteral(resourceName: "other")
        }
        
        menuButton.do {
            $0.setImage(UIImage(named: "pre"), for: .normal)
            $0.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        }
        
        bottomStackView.do {
            $0.axis = .horizontal
            $0.backgroundColor = .clear
            $0.isUserInteractionEnabled = true
            $0.spacing = 10
        }
    }
    
    private func setHierachy() {
        view.addSubview(backgroundView)
        view.addSubview(contentView)
        view.addSubview(detailCollecitonView)
        
        view.addSubview(bottomdivideView)
        view.addSubview(bottomStackView)
        bottomStackView.addArrangeSubViews(currentImage, dotImage)
        view.addSubview(mapImage)
        view.addSubview(menuButton)
    }
    

    private func setLayout() {
        backgroundView.snp.makeConstraints {
            $0.centerX.centerY.width.height.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.width.equalTo(view)
            $0.height.greaterThanOrEqualTo(view).priority(.high) //?
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
            $0.leading.equalTo(view.snp.leading).offset(10)
        }
        
        menuButton.snp.makeConstraints {
            $0.top.equalTo(bottomdivideView.snp.bottom).offset(2)
            $0.trailing.equalTo(view.snp.trailing).inset(20)
        }
    }
    
    private func setDelegate() {
        self.detailCollecitonView.delegate = self
        self.detailCollecitonView.dataSource = self
    }
    
    private func setupCollectionView() {
    
        self.detailCollecitonView.register(TopCollectionViewCell.self, forCellWithReuseIdentifier: TopCollectionViewCell.className)
        self.detailCollecitonView.register(TimeWeatherCollectionViewCell.self, forCellWithReuseIdentifier: TimeWeatherCollectionViewCell.className)
        self.detailCollecitonView.register(DayWeatherCollectionViewCell.self, forCellWithReuseIdentifier: DayWeatherCollectionViewCell.className)
        

        //Header, Footer
        self.detailCollecitonView.register(SecondCustomHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SecondCustomHeaderView.className)  //2번째 section
        self.detailCollecitonView.register(SecondCustomFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: SecondCustomFooterView.className) //2번째 section
        
        self.detailCollecitonView.register(CustomHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CustomHeaderView.className)  //3번째 section
        self.detailCollecitonView.register(CustomFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CustomFooterView.className) //3번째 section
    }
    
    

}

extension UIStackView {
    func addArrangeSubViews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}

extension ResultViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
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
    
    //section 갯수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    //section 별 cell 갯수
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
    
    //데이터 넣어주기
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier:  TopCollectionViewCell.className,for: indexPath) as? TopCollectionViewCell else {return UICollectionViewCell()}
            item.bindData(data: weatherList[indexPath.row])
            return item
        }
        else if indexPath.section == 1 {
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: TimeWeatherCollectionViewCell.className,for: indexPath) as? TimeWeatherCollectionViewCell else {return UICollectionViewCell()}
            item.bindData(data: TimeweatherList[indexPath.row])
            return item
        }
        else {
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: DayWeatherCollectionViewCell.className,for: indexPath) as? DayWeatherCollectionViewCell else {return UICollectionViewCell()}
            item.bindData(data: DayweatherList[indexPath.row])
            return item
            
        }
    }
    
    
    //1, 2, 3번째 섹션 별로 header, footer 넣어주기
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch indexPath.section {
            //case 0은 헤더가 없으므로 생략
        case 1 :
            if kind == UICollectionView.elementKindSectionHeader {
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SecondCustomHeaderView.className, for: indexPath) as? SecondCustomHeaderView else {
                    return SecondCustomHeaderView()
                }
                header.configure()
                return header
            } else {
                guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: SecondCustomFooterView.className, for: indexPath) as? SecondCustomFooterView else {
                    return SecondCustomFooterView()
                }
                footer.configure()
                return footer
            }
        case 2 :
            if kind == UICollectionView.elementKindSectionHeader {
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CustomHeaderView.className, for: indexPath) as? CustomHeaderView else {
                    return CustomHeaderView()
                }
                header.configure()
                return header
            } else {
                guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CustomFooterView.className, for: indexPath) as? CustomFooterView else {
                return CustomFooterView()
                }
                footer.configure()
                return footer
            }
        default :
            return CustomHeaderView()
        }
    }
    
    // 헤더의 크기를 지정
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
           switch section {
           case 1 :
               return CGSize(width: 300, height: 30)
               
           case 2 :
               return CGSize(width: 300, height: 30)
               
           default :
               return CGSize.zero
           }
     
       }
       
       // 푸터의 크기를 지정
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
           switch section {
           case 1 :
               return CGSize(width: 300, height: 0)
               
           case 2 :
               return CGSize(width: 300, height: 20)
               
           default :
               return CGSize.zero
           }
       }
}
