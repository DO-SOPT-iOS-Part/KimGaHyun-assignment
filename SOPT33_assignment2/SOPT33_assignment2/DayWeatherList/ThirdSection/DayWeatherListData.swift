//
//  DayWeatherListData.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/11/02.
//

import Foundation

// 요일 별 날씨 정보 Data
struct DayWeatherListData {
    let day: String
    let weatherimg : String
    let percent : String
    let weathercolor : String
    let mintemperature: String
    let tempbar : String
    let maxtemperature: String
    
    init(day: String, weatherimg: String, percent:String, weathercolor : String, mintemperature: String, tempbar: String, maxtemperature: String) {
        self.day = day
        self.weatherimg = weatherimg
        self.percent = percent
        self.weathercolor = weathercolor
        self.mintemperature = mintemperature
        self.tempbar = tempbar
        self.maxtemperature = maxtemperature
    }
}
var DayweatherList : [DayWeatherListData] = [.init(day: "오늘", weatherimg: "sun.max.fill", percent: "", weathercolor : "yellow", mintemperature: "15º", tempbar: "tempbar", maxtemperature: "29º"),
                                             .init(day: "월", weatherimg: "cloud.drizzle.fill", percent: "60%", weathercolor : "black", mintemperature: "18º", tempbar: "tempbar", maxtemperature: "27º"),
                                             .init(day: "화", weatherimg: "cloud.snow.fill", percent: "", weathercolor : "yellow", mintemperature: "20º", tempbar: "tempbar", maxtemperature: "25º"),
                                             .init(day: "수", weatherimg: "cloud.drizzle.fill", percent: "", weathercolor : "yellow", mintemperature: "17º", tempbar: "tempbar", maxtemperature: "25º"),
                                             .init(day: "목", weatherimg: "cloud.sun.fill", percent: "", weathercolor : "yellow", mintemperature: "17º", tempbar: "tempbar", maxtemperature: "25º"),
                                             .init(day: "금", weatherimg: "cloud.sun.fill", percent: "", weathercolor : "yellow", mintemperature: "20º", tempbar: "tempbar", maxtemperature: "26º"),
                                             .init(day: "토", weatherimg: "sun.max.fill", percent: "", weathercolor : "yellow", mintemperature: "18º", tempbar: "tempbar", maxtemperature: "25º"),
                                             .init(day: "일", weatherimg: "sun.max.fill", percent: "", weathercolor : "yellow", mintemperature: "13º", tempbar: "tempbar", maxtemperature: "21º"),
                                             .init(day: "월", weatherimg: "cloud.drizzle.fill", percent: "30%", weathercolor : "black", mintemperature: "12º", tempbar: "tempbar", maxtemperature: "19º"),
                                             .init(day: "화", weatherimg: "cloud.drizzle.fill", percent: "40%", weathercolor : "black", mintemperature: "18º", tempbar: "tempbar", maxtemperature: "25º"),
                                             .init(day: "수", weatherimg: "cloud.drizzle.fill", percent: "60%", weathercolor : "black", mintemperature: "18º", tempbar: "tempbar", maxtemperature: "25º")]
