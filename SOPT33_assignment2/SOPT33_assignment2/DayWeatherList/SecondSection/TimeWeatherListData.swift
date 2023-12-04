//
//  TimeWeatherListData.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/11/06.
//

import Foundation

// 시간 별  날씨 정보 Data - Horizontal CollectionView Cell
struct TimeWeatherListData {
    let time : String
    let weatherImage : String
    let temperature : String
    init(time : String, weatherImage : String, temperature : String) {
        self.time = time
        self.weatherImage = weatherImage
        self.temperature = temperature
    }
    
}
var TimeweatherList : [TimeWeatherListData] = [.init(time: "NOW", weatherImage: "cloud.moon.fill", temperature: "19º"),
                                               .init(time: "10시", weatherImage: "cloud.drizzle.fill", temperature: "21º"),
                                               .init(time: "11시", weatherImage: "cloud.rain.fill", temperature: "20º"),
                                               .init(time: "12시", weatherImage: "sun.max.fill", temperature: "24º"),
                                               .init(time: "13시", weatherImage: "sun.max.fill", temperature: "17º"),
                                               .init(time: "14시", weatherImage: "cloud.sun.fill", temperature: "22º"),
                                               .init(time: "15시", weatherImage: "cloud.drizzle.fill", temperature: "21º"),
                                               .init(time: "16시", weatherImage: "cloud.sun.fill", temperature: "20º"),
]

