//
//  CurrentWeather.swift
//  Stormy
//
//  Created by Leticia Rodriguez on 6/30/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

struct CurrentWeather{
    let temperature: Double
    let humidity: Double
    let precipitationProbability: Double
    let summary: String
    let icon: String
}

extension CurrentWeather{
    // los init escritos en la extension no sobreescriben los init member wise del objeto
    
    struct key {
        static let temperature = "temperature"
        static let humidity = "humidity"
        static let precipitationProbability = "precipProbability"
        static let summary = "summary"
        static let icon = "icon"
    }
    
    init?(json: [String: AnyObject]){
        guard let tempValue = json[key.temperature] as? Double,
        let humidityValue = json[key.humidity] as? Double,
        let precipitationProbabilityValue = json[key.precipitationProbability] as? Double,
        let summaryString = json[key.summary] as? String,
            let iconString = json[key.icon] as? String else {
                return nil
        }
        
        self.temperature = tempValue
        self.humidity = humidityValue
        self.precipitationProbability = precipitationProbabilityValue
        self.summary = summaryString
        self.icon = iconString
    }
}
