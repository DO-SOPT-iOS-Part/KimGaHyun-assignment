//
//  ViewController.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/10/15.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UISearchControllerDelegate {
    
    var searchWeatherListData = weatherList //검색 결과 데이터
    private lazy var etcButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "menu"), for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        //api key test
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else { return }
        print(apiKey)
        
        Task {
            await fetchWeatherInfo()
        }
        
        setupSearchController()
        setLayout()
        setTableViewConfig()
    }
    
    
    @objc func buttonPressed() {
        let resultVC = ResultViewController()  // ResultViewController 초기화
        navigationController?.pushViewController(resultVC, animated: true) // 화면에 표시
    }
   
    
    func setupSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "도시 또는 공항 검색"
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchResultsUpdater = self
        
        self.navigationItem.searchController = searchController
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "날씨"
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    
    private func setLayout() {
        view.addSubview(tableView)
        view.addSubview(etcButton)
        
        etcButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(80)
            $0.trailing.equalToSuperview().inset(25)
        }

        tableView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(55)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.snp.bottom)
        }
    }
    
    
    private func setTableViewConfig() {
        self.tableView.register(WeatherListTableViewCell.self,
                                forCellReuseIdentifier: WeatherListTableViewCell.className)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    

    private let tableView = UITableView(frame: .zero, style: .plain).then {
        $0.backgroundColor = .clear
    }

    //API에서 가져오는 timezone 현재 시간으로 변경하기
    func convertTime(timezone: Int) -> String {
        let timeZone = TimeZone(secondsFromGMT: timezone)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.timeZone = timeZone
        let currentDate = Date()
        let formattedTime = dateFormatter.string(from: currentDate)
        return formattedTime
    }
    
    private func fetchWeatherInfo() async {
            let cityname = ["seoul", "daegu", "ulsan", "chuncheon", "jeju", "gwangju", "suwon", "iksan", "busan"]
            
            for city in cityname {
//                print("❤️❤️", city)
                do {
                    let currentWeather = try await WeatherService.shared.getWeatherData(cityname: city)
                    print("type:", type(of: currentWeather.timezone))
                    let weatherInfo = WeatherListData(location: currentWeather.name,
                                                      time: convertTime(timezone: currentWeather.timezone),
                                                      weather: currentWeather.weather[0].main,
                                                      temperature: Int(currentWeather.main.temp),
                                                      max: Int(currentWeather.main.tempMax),
                                                      min: Int(currentWeather.main.tempMin))
                    weatherList.append(weatherInfo)
                    searchWeatherListData = weatherList
                } catch {
                    print(error)
                }
            }
            tableView.reloadData()
        }
}


extension ViewController: UITableViewDelegate {}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchWeatherListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherListTableViewCell.className,
            for: indexPath) as? WeatherListTableViewCell else {return UITableViewCell()}
        
        cell.bindData(data: searchWeatherListData[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            print("Click Cell Number:" + String(indexPath.row))
            buttonPressed()
    }
}

//검색 기능
//searchWeatherListData -> searchbar에 text가 있을 경우, 없을 경우 나누기 위해 기존의 weatherList 대입
extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        if text.isEmpty {
            searchWeatherListData = weatherList
            print("🍎🍎🍎",searchWeatherListData.count)
        } else {
            searchWeatherListData = weatherList.filter { $0.location.lowercased().contains(text.lowercased()) }
        }
    tableView.reloadData()
    }
}
