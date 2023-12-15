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
    
    // MARK: - Properties
    
    private var resultView: DetailWeatherListView?
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setResultView()
        setDelegate()
        setupCollectionView()
    }
    
    
    // MARK: - Button Action
    
    @objc func buttonPressed() {
        print("BUTTON PRESSED")
        navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - ResultView
    
    private func setResultView() {
        resultView = DetailWeatherListView(frame: view.bounds)
        if let resultView = resultView {
            view.addSubview(resultView)
            resultView.configure()
        }
        
        resultView?.menuButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    
    // MARK: - set Delegate
    
    private func setDelegate() {
        resultView?.detailCollecitonView.delegate = self
        resultView?.detailCollecitonView.dataSource = self
    }
    
    
    // MARK: - set CollectionView
    
    private func setupCollectionView() {
        resultView?.detailCollecitonView.register(TopCollectionViewCell.self,
                                           forCellWithReuseIdentifier: TopCollectionViewCell.className)
        resultView?.detailCollecitonView.register(TimeWeatherCollectionViewCell.self,
                                           forCellWithReuseIdentifier: TimeWeatherCollectionViewCell.className)
        resultView?.detailCollecitonView.register(DayWeatherCollectionViewCell.self,
                                           forCellWithReuseIdentifier: DayWeatherCollectionViewCell.className)
        
        
        //Header, Footer
        resultView?.detailCollecitonView.register(SecondCustomHeaderView.self,
                                           forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                           withReuseIdentifier: SecondCustomHeaderView.className)  //2번째 section
        resultView?.detailCollecitonView.register(SecondCustomFooterView.self,
                                           forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                           withReuseIdentifier: SecondCustomFooterView.className) //2번째 section
        
        resultView?.detailCollecitonView.register(CustomHeaderView.self,
                                           forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                           withReuseIdentifier: CustomHeaderView.className)  //3번째 section
        resultView?.detailCollecitonView.register(CustomFooterView.self,
                                           forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                           withReuseIdentifier: CustomFooterView.className) //3번째 section
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
