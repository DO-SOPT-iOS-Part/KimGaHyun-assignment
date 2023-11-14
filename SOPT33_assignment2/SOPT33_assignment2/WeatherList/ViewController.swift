//
//  ViewController.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/10/15.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UISearchControllerDelegate {


    private var searchBar : UISearchBar = {
        let searchbar = UISearchBar()
        searchbar.placeholder = "도시 또는 공항 검색"
        searchbar.searchTextField.textColor = .white
        searchbar.searchTextField.backgroundColor = UIColor.darkGray.withAlphaComponent(0.3)
        searchbar.searchTextField.font = .regular(size: 19)
        searchbar.translatesAutoresizingMaskIntoConstraints = false
        return searchbar
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        //api key test
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else { return }
        print(apiKey)

        Task {
            await fetchWeatherInfo()
        }
        
        
        mainLayout()
        setSearchBarLayout()
            
        setLayout()
        setTableViewConfig()
    }
    
    
    
    
    @objc func buttonPressed() {
        let resultVC = ResultViewController()  // ResultViewController 초기화
        navigationController?.pushViewController(resultVC, animated: true) // 화면에 표시
    }
   
    
    func mainLayout() {
        [etcButton, mainTitle].forEach {
            view.addSubview($0)
        }
        view.addSubview(etcButton)
        view.addSubview(mainTitle)
        
        etcButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.trailing.equalToSuperview().inset(25)
        }
        
        mainTitle.snp.makeConstraints {
            $0.top.equalToSuperview().inset(120)
            $0.leading.equalToSuperview().inset(10)
        }
    }
    
    
    func setSearchBarLayout() {
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints {
            $0.top.equalTo(mainTitle.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    private func setLayout() {
        view.addSubview(tableView)

        tableView.snp.makeConstraints {
            $0.top.equalTo(mainTitle.snp.bottom).offset(55)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.snp.bottom)
        }
    }
    
    
    private func setTableViewConfig() {
        self.tableView.register(WeatherListTableViewCell.self,
                                forCellReuseIdentifier: WeatherListTableViewCell.identifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    

    private let tableView = UITableView(frame: .zero, style: .plain).then {
        $0.backgroundColor = .clear
        $0.separatorColor = .lightGray
        $0.separatorStyle = .singleLine
    }

    //API에서 가져오는 timezone 현재 시간으로 변경하기
    func convertTime(timezone: Int) -> String {
        let timeZone = TimeZone(secondsFromGMT: timezone)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.timeZone = timeZone
        let currentDate = Date()
        var formattedTime = dateFormatter.string(from: currentDate)
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
        return weatherList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherListTableViewCell.identifier,
            for: indexPath) as? WeatherListTableViewCell else {return UITableViewCell()}
        
        cell.bindData(data: weatherList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            print("Click Cell Number:" + String(indexPath.row))
            buttonPressed()
    }
}

