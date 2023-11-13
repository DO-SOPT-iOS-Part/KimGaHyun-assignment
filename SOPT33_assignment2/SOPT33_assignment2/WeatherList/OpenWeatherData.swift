//
//  OpenWeatherData.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/11/12.
//

import Foundation
import UIKit

struct OpenWeatherData: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}


struct Clouds: Codable {
    let all: Int
}


struct Coord: Codable {
    let lon, lat: Double
}


struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity, seaLevel, grndLevel: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}


struct Sys: Codable {
    let country: String
    let sunrise, sunset: Int
}


struct Weather: Codable {
    let id: Int
    let main, description, icon: String
}


struct Wind: Codable {
    let speed, deg: Int
    let gust: Double
}





    
    // Example usage:
    let json = """
    {
        "coord": {
            "lon": -0.13,
            "lat": 51.51
        },
        "weather": [
            {
                "id": 300,
                "main": "Drizzle",
                "description": "light intensity drizzle",
                "icon": "09d"
            }
        ],
        "base": "stations",
        "main": {
            "temp": 280.32,
            "pressure": 1012,
            "humidity": 81,
            "temp_min": 279.15,
            "temp_max": 281.15
        },
        "visibility": 10000,
        "wind": {
            "speed": 4.1,
            "deg": 80
        },
        "clouds": {
            "all": 90
        },
        "dt": 1485789600,
        "sys": {
            "type": 1,
            "id": 5091,
            "message": 0.0103,
            "country": "GB",
            "sunrise": 1485762037,
            "sunset": 1485794875
        },
        "id": 2643743,
        "name": "London",
        "cod": 200
    }
"""
    



