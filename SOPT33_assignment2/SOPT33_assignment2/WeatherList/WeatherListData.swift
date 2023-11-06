//
//  WeatherListData.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/10/30.
//
import UIKit

struct WeatherListData {
    let location: String
    let weather: String
    let temperature: String
    let maxmin: String
    
    init(location: String, weather: String, temperature: String, maxmin: String) {
        self.location = location
        self.weather = weather
        self.temperature = temperature
        self.maxmin = maxmin
    }
}


var weatherList : [WeatherListData] = [.init(location: "의정부시", weather: "흐림", temperature: "21º", maxmin: "최고:29º 최저:24º"),
                                       .init(location: "송파구", weather: "흐림", temperature: "22º", maxmin: "최고:28º 최저:23º"),
                                       .init(location: "광진구", weather: "맑음", temperature: "23º", maxmin: "최고:29º 최저:23º"),
                                       .init(location: "동대문구", weather: "비", temperature: "19º", maxmin: "최고:25º 최저:29º"),
                                       .init(location: "마포구", weather: "맑음", temperature: "23º", maxmin: "최고:29º 최저:23º")]
