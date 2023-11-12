//
//  WeatherService.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/11/12.
//

import Foundation

class WeatherService {
    private let apiKey = "YOUR_OPENWEATHERMAP_API_KEY"

    func getWeatherData(for city: String, completion: @escaping (WeatherListData?, Error?) -> Void) {
        // API Endpoint URL 생성
        let apiUrl = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)"

        // URLSession을 사용하여 네트워크 요청
        if let url = URL(string: apiUrl) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(nil, error)
                } else if let data = data {
                    do {
                        // JSON 디코딩
                        let decoder = JSONDecoder()
                        let weatherData = try decoder.decode(OpenWeatherData.self, from: data)

                        // OpenWeatherData로부터 필요한 정보를 추출하여 WeatherListData 생성
                        let weatherListData = WeatherListData(
                            location: city,
                            time: "05:20",  // TODO: 시간 정보를 받아오는 방법을 추가하세요.
                            weather: weatherData.weather.first?.description ?? "",
                            temperature: "\(weatherData.main.temp)º",
                            maxmin: "최고: \(weatherData.main.temp_max)º 최저: \(weatherData.main.temp_min)º"
                        )

                        completion(weatherListData, nil)
                    } catch {
                        completion(nil, error)
                    }
                }
            }
            task.resume()
        }
    }
}
