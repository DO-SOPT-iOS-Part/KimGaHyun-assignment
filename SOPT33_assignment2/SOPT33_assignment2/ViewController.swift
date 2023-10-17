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
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.prefersLargeTitles = true
        return navigationBar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view.addSubview(navigationBar)

        navigationItem.title = "날씨"
        let safeArea = self.view.safeAreaLayoutGuide

        navigationBar.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        navigationBar.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        navigationBar.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        navigationBar.setItems([navigationItem], animated: true)
        


    }
    

}








