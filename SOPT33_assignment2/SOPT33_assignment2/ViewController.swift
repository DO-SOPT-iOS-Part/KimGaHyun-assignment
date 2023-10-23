//
//  ViewController.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/10/15.
//

import UIKit

class ViewController: UIViewController, UISearchControllerDelegate {
    
    private var searchBar : UISearchBar = {
        let searchbar = UISearchBar()
        searchbar.placeholder = "도시 또는 공항 검색"
        searchbar.searchTextField.textColor = .white
        searchbar.searchTextField.backgroundColor = .gray
        searchbar.searchTextField.font = .regular(size: 19)
        searchbar.translatesAutoresizingMaskIntoConstraints = false
        return searchbar
    }()
    
    
    
    //    let navigationBar : UINavigationBar = {
    //        let navigationBar = UINavigationBar()
    //
    //        navigationBar.prefersLargeTitles = true
    //        return navigationBar
    //    }()

    
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    
    private var listView : UIImageView = {
        let listView = UIImageView()
        listView.image = UIImage(named: "list")
        listView.translatesAutoresizingMaskIntoConstraints = false
        return listView
    }()
    
    private var mainTitle : UILabel = {
        let label = UILabel()
        label.text = "날씨"
        label.font = .bold(size: 40)
        label.textColor = .black
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
    
    
    //왼쪽 스택뷰 : 나의 위치, 의정부시, 흐림
    private var leftStackView: UIStackView = {
        let leftstackview = UIStackView()
        leftstackview.axis = .vertical
        leftstackview.backgroundColor = .clear
        leftstackview.distribution = .fillEqually
        leftstackview.isUserInteractionEnabled = true
        leftstackview.translatesAutoresizingMaskIntoConstraints = false
        return leftstackview
    }()
    

    
    private var dcLabel : UILabel = {
        let label = UILabel()
        label.text = "21º"
        label.font = .light(size: 50)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    //오른쪽 스택뷰 : 온도, 최고, 최저 온도
    private var rightStackView: UIStackView = {
        let rightstackview = UIStackView()
        rightstackview.axis = .vertical
        rightstackview.backgroundColor = .clear
        rightstackview.distribution = .fillEqually
        rightstackview.isUserInteractionEnabled = true
        rightstackview.translatesAutoresizingMaskIntoConstraints = false
        return rightstackview
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setViewLayout()
        mainLayout()
        setSearchBarLayout()
        setWeatherLayout()
        
       // navigationItem.title = "날씨"
        //navigationBar.setItems([navigationItem], animated: true)
        
    }
    
    
    
//    @objc func listViewTapped() {
//        let resultVC = ResultViewController()
//        navigationController?.pushViewController(resultVC, animated: true)
//    }

    
    
//    private func setLayout() {
//        self.view.addSubview(navigationBar)
//        self.view.addSubview(scrollView)
//        self.view.addSubview(searchBar)
//        self.view.addSubview(contentView)
//        self.view.addSubview(mainLabel)
//        self.view.addSubview(locationLabel)
//        self.view.addSubview(weatherLabel)
//
//        navigationBar.translatesAutoresizingMaskIntoConstraints = false
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        contentView.translatesAutoresizingMaskIntoConstraints = false
//
//
//        NSLayoutConstraint.activate([
//            navigationBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
//            navigationBar.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
//            navigationBar.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
//        ])
//

//
//        NSLayoutConstraint.activate([
//            scrollView.topAnchor.constraint(equalTo: navigationBar.topAnchor, constant: 150),
//            scrollView.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor, constant: 10),
//            scrollView.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor, constant: -20),
//            scrollView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 10)])
//
//        NSLayoutConstraint.activate([
//            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
//            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
//            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
//            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor)])
//
//        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        
//        [listView].forEach {
//            $0.translatesAutoresizingMaskIntoConstraints = false
//            contentView.addSubview($0)
//        }
//
//        NSLayoutConstraint.activate([
//            listView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
//            listView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
//            listView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
//            listView.heightAnchor.constraint(equalToConstant: 117),
//            listView.widthAnchor.constraint(equalToConstant: 335)])
//
//
//        //listView안에 label들 layout
//        NSLayoutConstraint.activate([
//            mainLabel.topAnchor.constraint(equalTo: listView.topAnchor, constant: 13),
//            mainLabel.leadingAnchor.constraint(equalTo: listView.leadingAnchor, constant: 15),
//            mainLabel.trailingAnchor.constraint(equalTo: listView.trailingAnchor, constant: 10),
//
//            locationLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 5),
//            locationLabel.leadingAnchor.constraint(equalTo: listView.leadingAnchor, constant: 15),
//            locationLabel.trailingAnchor.constraint(equalTo: listView.trailingAnchor),
//
//            weatherLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 18),
//            weatherLabel.leadingAnchor.constraint(equalTo: listView.leadingAnchor, constant: 15),
//            weatherLabel.trailingAnchor.constraint(equalTo: listView.trailingAnchor)
//        ])
//    }
    
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
        contentView.addSubview(mainTitle)
        
        NSLayoutConstraint.activate([
            mainTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            mainTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
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
        contentView.addSubview(listView)
        listView.addSubview(leftStackView)
        listView.addSubview(rightStackView)
        leftStackView.addArrangedSubview(mainLabel)
        leftStackView.addArrangedSubview(locationLabel)
        leftStackView.addArrangedSubview(weatherLabel)
        
        rightStackView.addArrangedSubview(dcLabel)
        
        NSLayoutConstraint.activate([
            listView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            listView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            listView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            listView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/7)
        ])
        
        NSLayoutConstraint.activate([
            leftStackView.topAnchor.constraint(equalTo: listView.topAnchor, constant: 10),
            leftStackView.leadingAnchor.constraint(equalTo: listView.leadingAnchor, constant: 10),
            leftStackView.trailingAnchor.constraint(equalTo: listView.trailingAnchor, constant: -50)
        ])
        
        
        NSLayoutConstraint.activate([
            rightStackView.topAnchor.constraint(equalTo: listView.topAnchor, constant: 5),
            rightStackView.leadingAnchor.constraint(equalTo: listView.leadingAnchor, constant: 290),
            rightStackView.trailingAnchor.constraint(equalTo: listView.trailingAnchor, constant: -10)
        ])
    }

}








