//
//  ViewController.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/10/15.
//

import UIKit

import SnapKit
import Then

final class ViewController: UIViewController, UISearchControllerDelegate {
    

    // MARK: - set Properties

    var searchWeatherListData = weatherList //검색 결과 데이터
    private var weatherListView : WeatherListView?
    var weatherListViewModel = WeatherListViewModel()

    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setWeatherListView()
        setNavigation()
        setTableViewConfig()
        
        setDelegate()
        bindViewModel()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadData()
    }

    
    // MARK: - set WeatherList View

    private func setWeatherListView() {
        weatherListView = WeatherListView(frame: view.bounds)
        if let resultView = weatherListView {
            view.addSubview(resultView)
            resultView.configure()
        }
        self.weatherListView?.searchController.searchResultsUpdater = self
    }
    
    
    // MARK: - set Navigation

    func setNavigation() {
        self.navigationItem.searchController = weatherListView?.searchController
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "날씨"
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    
    // MARK: - set TableView

    private func setTableViewConfig() {
        weatherListView?.tableView.register(WeatherListTableViewCell.self,
                                forCellReuseIdentifier: WeatherListTableViewCell.className)
    }


    // MARK: - set Delegate

    private func setDelegate() {
        weatherListView?.tableView.delegate = self
    }

    
    // MARK: - binding ViewModel
    
    private func bindViewModel() {
        self.weatherListView?.tableView.dataSource = weatherListViewModel
        self.weatherListView?.tableView.reloadData()
    }
}


// Cell 클릭 시 화면 이동
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            print("Click Cell Number:" + String(indexPath.row))
        let resultVC = ResultViewController()
        navigationController?.pushViewController(resultVC, animated: true)
    }
}


//searchWeatherListData -> searchbar에 text가 있을 경우, 없을 경우 나누기 위해 기존의 weatherList 대입
extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        if text.isEmpty {
            searchWeatherListData = weatherList
        } else {
            searchWeatherListData = weatherList.filter { $0.location.lowercased().contains(text.lowercased()) }
        }
        weatherListView?.tableView.reloadData()
    }
}

// 날씨 데이터
extension ViewController {
    private func loadData() {
        Task {
            let success = await weatherListViewModel.fetchWeatherInfo()
            if success {
                self.weatherListView?.tableView.reloadData()
            }
        }
    }
}
