//
//  OpenWeatherData.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/11/12.
//

import Foundation

struct OpenWeatherData: Codable {
    let weather: [WeatherDescription]
    let main: Main
}

struct WeatherDescription: Codable {
    let description: String
}

struct Main: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}

