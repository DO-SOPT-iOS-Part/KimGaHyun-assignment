//
//  DayWeatherListData.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/11/02.
//

import Foundation


import UIKit

struct DayWeatherListData {
    let day: String
    let weatherimg : String
    let weathercolor : String
    let mintemperature: String
    let tempbar : String
    let maxtemperature: String
    
    init(day: String, weatherimg: String, weathercolor : String, mintemperature: String, tempbar: String, maxtemperature: String) {
        self.day = day
        self.weatherimg = weatherimg
        self.weathercolor = weathercolor
        self.mintemperature = mintemperature
        self.tempbar = tempbar
        self.maxtemperature = maxtemperature
    }
}
var DayweatherList : [DayWeatherListData] = [.init(day: "오늘", weatherimg: "sun.max.fill", weathercolor : "yellow", mintemperature: "15º", tempbar: "tempbar", maxtemperature: "29º"),
                                             .init(day: "월", weatherimg: "cloud.drizzle.fill", weathercolor : "black", mintemperature: "18º", tempbar: "tempbar", maxtemperature: "27º"),
                                             .init(day: "화", weatherimg: "cloud.snow.fill", weathercolor : "yellow", mintemperature: "20º", tempbar: "tempbar", maxtemperature: "25º"),
                                             .init(day: "수", weatherimg: "cloud.drizzle.fill", weathercolor : "yellow", mintemperature: "17º", tempbar: "tempbar", maxtemperature: "25º"),
                                             .init(day: "목", weatherimg: "cloud.sun.fill", weathercolor : "yellow", mintemperature: "17º", tempbar: "tempbar", maxtemperature: "25º"),
                                             .init(day: "금", weatherimg: "cloud.sun.fill", weathercolor : "yellow", mintemperature: "20º", tempbar: "tempbar", maxtemperature: "26º"),
                                             .init(day: "토", weatherimg: "sun.max.fill", weathercolor : "yellow", mintemperature: "18º", tempbar: "tempbar", maxtemperature: "25º"),
                                             .init(day: "일", weatherimg: "sun.max.fill", weathercolor : "yellow", mintemperature: "13º", tempbar: "tempbar", maxtemperature: "21º"),
                                             .init(day: "월", weatherimg: "cloud.drizzle.fill", weathercolor : "black", mintemperature: "12º", tempbar: "tempbar", maxtemperature: "19º"),
                                             .init(day: "화", weatherimg: "cloud.drizzle.fill", weathercolor : "black", mintemperature: "18º", tempbar: "tempbar", maxtemperature: "25º"),
                                             .init(day: "수", weatherimg: "cloud.drizzle.fill", weathercolor : "black", mintemperature: "18º", tempbar: "tempbar", maxtemperature: "25º")]
