//
//  ViewController.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/10/15.
//

import UIKit

class ViewController: UIViewController, UISearchControllerDelegate {

    private let scrollView = UIScrollView()
    private let contentView = UIImageView()
    
    private var searchBar : UISearchBar = {
        let searchbar = UISearchBar()
        searchbar.placeholder = "도시 또는 공항 검색"
        searchbar.searchTextField.textColor = .white
        searchbar.searchTextField.backgroundColor = UIColor.darkGray.withAlphaComponent(0.3)
        searchbar.searchTextField.font = .regular(size: 19)
        searchbar.translatesAutoresizingMaskIntoConstraints = false
        return searchbar
    }()
    
    private lazy var listView : UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "list")
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    

    private lazy var etcButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "menu"), for: .normal)
        return button
    }()

    
    private var mainTitle : UILabel = {
        let label = UILabel()
        label.text = "날씨"
        label.font = .bold(size: 40)
        label.textColor = .white
        return label
    }()
    
    private var mainLabel : UILabel = {
        let label = UILabel()
        label.text = "나의 위치"
        label.font = .bold(size: 23)
        label.textColor = .white
        return label
    }()
    
    private var locationLabel : UILabel = {
        let label = UILabel()
        label.text = "의정부시"
        label.font = .medium(size: 17)
        label.textColor = .white
        return label
    }()
    
    private var weatherLabel : UILabel = {
        let label = UILabel()
        label.text = "흐림"
        label.font = .medium(size: 17)
        label.textColor = .white
        return label
    }()

    
    private var dcLabel : UILabel = {
        let label = UILabel()
        label.text = "21º"
        label.font = .light(size: 53)
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    
    private var maxminLabel : UILabel = {
        let label = UILabel()
        label.text = "최고:29º 최저:25º"
        label.font = .medium(size: 16)
        label.textColor = .white
        label.backgroundColor = .clear
        label.textAlignment = .right
        return label
    }()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(buttonPressed))
        listView.isUserInteractionEnabled = true
        listView.addGestureRecognizer(tapGesture)
        
        setViewLayout()
        mainLayout()
        setSearchBarLayout()
        setWeatherLayout()
        
       // navigationItem.title = "날씨"
        //navigationBar.setItems([navigationItem], animated: true)
    
    }
    
    
    @objc func buttonPressed() {
        let resultVC = ResultViewController()  // ResultViewController 초기화
        navigationController?.pushViewController(resultVC, animated: true) // 화면에 표시
    }
    
    func setViewLayout() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)])
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor)])
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow
        contentViewHeight.isActive = true
        
    }
    
    func mainLayout() {
        [etcButton, mainTitle].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        view.addSubview(etcButton)
        view.addSubview(mainTitle)
        
        NSLayoutConstraint.activate([
            etcButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            etcButton.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50)
        ])
        
        
        NSLayoutConstraint.activate([
            mainTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            mainTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            mainTitle.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            mainTitle.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    
    func setSearchBarLayout() {

        view.addSubview(searchBar)
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
    
    func setWeatherLayout() {
        view.addSubview(listView)

        [mainLabel, locationLabel, weatherLabel, dcLabel, maxminLabel].forEach {
            listView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            listView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            listView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            listView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])

        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: listView.topAnchor, constant: 13),
            mainLabel.leadingAnchor.constraint(equalTo: listView.leadingAnchor, constant: 13),
            mainLabel.trailingAnchor.constraint(equalTo: listView.trailingAnchor, constant: -250),
            
            locationLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 7),
            locationLabel.leadingAnchor.constraint(equalTo: listView.leadingAnchor, constant: 13),
            locationLabel.trailingAnchor.constraint(equalTo: mainLabel.trailingAnchor, constant: -10),
            
            weatherLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 20),
            weatherLabel.leadingAnchor.constraint(equalTo: listView.leadingAnchor, constant: 13),
            weatherLabel.trailingAnchor.constraint(equalTo: weatherLabel.trailingAnchor),
            
            dcLabel.topAnchor.constraint(equalTo: listView.topAnchor, constant: 7),
            dcLabel.leadingAnchor.constraint(equalTo: listView.trailingAnchor, constant: -80),
            
            maxminLabel.topAnchor.constraint(equalTo: dcLabel.bottomAnchor, constant: 15),
            maxminLabel.trailingAnchor.constraint(equalTo: dcLabel.trailingAnchor)
        ])
    }
}
