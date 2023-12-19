//
//  WeatherListViewModel.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/12/18.
//
//
import UIKit

final class WeatherListViewModel: NSObject {
    
    // MARK: - Set Properties
    
    var searchWeatherListData = weatherList //검색 결과 데이터
    private var weatherListView : WeatherListView?
    
    
    // MARK: - Set Network
    
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
    
    func fetchWeatherInfo() async -> Bool {
        let cityname = ["seoul",
                        "daegu",
                        "ulsan",
                        "chuncheon",
                        "jeju",
                        "gwangju",
                        "suwon",
                        "iksan",
                        "busan"]
        
        for city in cityname {
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
        return true
    }
}


extension WeatherListViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchWeatherListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherListTableViewCell.className,
                                                       for: indexPath) as? WeatherListTableViewCell else {return UITableViewCell()}
        
        cell.bindData(data: searchWeatherListData[indexPath.row])
        return cell
    }
}
