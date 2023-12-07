//
//  WeatherListView.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/12/07.
//

import UIKit

import SnapKit
import Then

final class WeatherListView: UIView {

    // MARK: - set Properties
    
    lazy var etcButton = UIButton()
    let searchController = UISearchController(searchResultsController: nil)
    let tableView = UITableView(frame: .zero, style: .plain)
    
    
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
        self.backgroundColor = .black
        
        etcButton.do {
            $0.setImage(UIImage(named: "menu"), for: .normal)
        }
        
        searchController.do {
            $0.searchBar.placeholder = "도시 또는 공항 검색"
            $0.hidesNavigationBarDuringPresentation = false
        }
        
        tableView.do {
            $0.backgroundColor = .clear
        }
    }
    
    
    // MARK: - set Hierarchy
    
    func setHierarchy() {
        addSubviews(tableView, etcButton)
    }
    
    
    // MARK: - set Layout
    
    func setLayout() {
        etcButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(80)
            $0.trailing.equalToSuperview().inset(25)
        }

        tableView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(55)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.snp.bottom)
        }
    }
}
