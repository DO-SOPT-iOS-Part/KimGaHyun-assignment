//
//  ViewController.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/10/15.
//

import UIKit

class ViewController: UIViewController, UISearchControllerDelegate {
    

    
    private let scrollView = UIScrollView()
    private var contentView = UIImageView()
    
    private var searchBar : UISearchBar = {
        let searchbar = UISearchBar()
        searchbar.placeholder = "도시 또는 공항 검색"
        searchbar.searchTextField.textColor = .white
        searchbar.searchTextField.backgroundColor = .gray
        searchbar.searchTextField.font = .regular(size: 19)
        searchbar.translatesAutoresizingMaskIntoConstraints = false
        return searchbar
    }()
    
    private lazy var testbutton : UIButton = {
       let testbutton = UIButton()
        testbutton.setTitle("Button", for: .normal)
        testbutton.setTitleColor(.white, for: .normal)
        testbutton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        testbutton.translatesAutoresizingMaskIntoConstraints = false
        
        return testbutton
    }()
    
    private lazy var listbutton : UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "list"), for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    private lazy var etcButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "menu"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    private var mainTitle : UILabel = {
        let label = UILabel()
        label.text = "날씨"
        label.font = .bold(size: 40)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var mainLabel : UILabel = {
        let label = UILabel()
        label.text = "나의 위치"
        label.font = .bold(size: 23)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var locationLabel : UILabel = {
        let label = UILabel()
        label.text = "의정부시"
        label.font = .medium(size: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var weatherLabel : UILabel = {
        let label = UILabel()
        label.text = "흐림"
        label.font = .medium(size: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    private var dcLabel : UILabel = {
        let label = UILabel()
        label.text = "21º"
        label.font = .light(size: 53)
        label.textColor = .white
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private var maxminLabel : UILabel = {
        let label = UILabel()
        label.text = "최고:29º 최저:25º"
        label.font = .regular(size: 16)
        label.textColor = .white
        label.backgroundColor = .clear
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setViewLayout()
        mainLayout()
        setSearchBarLayout()
        setWeatherLayout()
        
       // navigationItem.title = "날씨"
        //navigationBar.setItems([navigationItem], animated: true)
        
    }
    
    @objc func buttonTapped() {
        print("이미지 버튼이 클릭됐다. ")
    }
    

    @objc func buttonPressed(_ gesture: UITapGestureRecognizer) {
        let resultVC = ResultViewController()  // ResultViewController 초기화
        navigationController?.pushViewController(resultVC, animated: true) // 화면에 표시
        print("OK")
    }

    
    
    
    func setViewLayout() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        //navigationBar.translatesAutoresizingMaskIntoConstraints = false
        
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
        contentView.addSubview(etcButton)
        contentView.addSubview(mainTitle)
        
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
        contentView.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
    
    func setWeatherLayout() {
        contentView.addSubview(listbutton)

        listbutton.addSubview(mainLabel)
        listbutton.addSubview(locationLabel)
        listbutton.addSubview(weatherLabel)
        listbutton.addSubview(dcLabel)
        listbutton.addSubview(maxminLabel)

        
        NSLayoutConstraint.activate([
            listbutton.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            listbutton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            listbutton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])
        
        
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: listbutton.topAnchor, constant: 13),
            mainLabel.leadingAnchor.constraint(equalTo: listbutton.leadingAnchor, constant: 13),
            mainLabel.trailingAnchor.constraint(equalTo: listbutton.trailingAnchor, constant: -250),
            
            locationLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 7),
            locationLabel.leadingAnchor.constraint(equalTo: listbutton.leadingAnchor, constant: 13),
            locationLabel.trailingAnchor.constraint(equalTo: mainLabel.trailingAnchor, constant: -10),
            
            weatherLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 20),
            weatherLabel.leadingAnchor.constraint(equalTo: listbutton.leadingAnchor, constant: 13),
            weatherLabel.trailingAnchor.constraint(equalTo: weatherLabel.trailingAnchor),
            
            dcLabel.topAnchor.constraint(equalTo: listbutton.topAnchor, constant: 7),
            dcLabel.leadingAnchor.constraint(equalTo: listbutton.trailingAnchor, constant: -80),
            
            maxminLabel.topAnchor.constraint(equalTo: dcLabel.bottomAnchor, constant: 15),
            maxminLabel.trailingAnchor.constraint(equalTo: dcLabel.trailingAnchor)
        ])
        
        
        //test
        view.addSubview(testbutton)
        NSLayoutConstraint.activate([
            testbutton.topAnchor.constraint(equalTo: listbutton.bottomAnchor, constant: 40),
        ])
        
        
    
    }


}








