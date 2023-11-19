//
//  WeatherListData.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/10/30.
//
import UIKit

struct WeatherListData {
    let location: String
    let time : String
    let weather: String
    let temperature: Int
    let max: Int
    let min: Int


    init(location: String, time: String, weather: String, temperature: Int, max: Int, min: Int) {
        self.location = location
        self.time = time
        self.weather = weather
        self.temperature = temperature - 273
        self.max = max - 273
        self.min = min - 273
    }
}

var weatherList : [WeatherListData] = []
