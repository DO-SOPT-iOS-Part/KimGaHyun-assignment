//
//  WeatherService.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/11/12.
//
import Foundation

final class WeatherService {
    
    static let shared = WeatherService()
    private init() {}

   // private let apiKey = "c7c81491f7fd0225920b6378a5dd0d82"

    
    //request
    func makeRequest(cityname: String) -> URLRequest {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityname)&appid=c7c81491f7fd0225920b6378a5dd0d82")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        return request
    }
    
    func getWeatherData(cityname: String) async throws -> OpenWeatherData {
        do {
            let request = self.makeRequest(cityname: cityname)
            let (data, response) = try await URLSession.shared.data(for: request)
            dump(request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }
            dump(response)
            guard let parseData = parseUserInfoData(data: data)
            else {
                throw NetworkError.responseDecodingError
            }
            return parseData
        } catch {
            throw error
        }
        
    }
    
    
    private func parseUserInfoData(data: Data) -> OpenWeatherData? {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(OpenWeatherData.self, from: data)
            return result
        } catch {
            print(error)
            return nil
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode)
        ?? NetworkError.unknownError
    }

}
