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
        searchbar.placeholder = "Search"
        searchbar.translatesAutoresizingMaskIntoConstraints = false
        return searchbar
    }()

    let navigationBar : UINavigationBar = {
        let navigationBar = UINavigationBar()
        
        navigationBar.prefersLargeTitles = true
        return navigationBar
    }()
    
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    
    private var listView : UIImageView = {
        let listView = UIImageView()
        listView.image = UIImage(named: "list")
        listView.translatesAutoresizingMaskIntoConstraints = false
        return listView
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
        label.text = "21"
        label.font = .light(size: 28)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()

        navigationItem.title = "날씨"
        navigationBar.setItems([navigationItem], animated: true)
        
    }
    
    private func setLayout() {
        self.view.addSubview(navigationBar)
        self.view.addSubview(scrollView)
        self.view.addSubview(contentView)
        self.view.addSubview(mainLabel)
        self.view.addSubview(locationLabel)
        self.view.addSubview(weatherLabel)
        
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            navigationBar.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
        ])
        

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: navigationBar.topAnchor, constant: 150),
            scrollView.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor, constant: 10),
            scrollView.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor, constant: -20),
            scrollView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 10)])
                
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor)])
        
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        //let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: view.heightAnchor)
        //contentViewHeight.priority = .defaultLow
        //contentViewHeight.isActive = true
        
        [listView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            listView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            listView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            listView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            listView.heightAnchor.constraint(equalToConstant: 117),
            listView.widthAnchor.constraint(equalToConstant: 335)])
        
        
        //listView안에 label들 layout
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: listView.topAnchor, constant: 13),
            mainLabel.leadingAnchor.constraint(equalTo: listView.leadingAnchor, constant: 15),
            mainLabel.trailingAnchor.constraint(equalTo: listView.trailingAnchor, constant: 10),
            
            locationLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 5),
            locationLabel.leadingAnchor.constraint(equalTo: listView.leadingAnchor, constant: 15),
            locationLabel.trailingAnchor.constraint(equalTo: listView.trailingAnchor),
            
            weatherLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 18),
            weatherLabel.leadingAnchor.constraint(equalTo: listView.leadingAnchor, constant: 15),
            weatherLabel.trailingAnchor.constraint(equalTo: listView.trailingAnchor)
        ])
    }
    

}








