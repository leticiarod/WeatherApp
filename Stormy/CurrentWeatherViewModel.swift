//
//  CurrentWeatherViewModel.swift
//  Stormy
//
//  Created by Leticia Rodriguez on 6/30/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation
import UIKit

struct CurrentWeatherModel {
    let temperature: String
    let humidity: String
    let precipitationProbability: String
    let summary: String
    let icon: UIImage
    
    // este inicializador va a sobreescribir el memberwise init, y eso esxactamnete lo que queremos para que este objeto solo puede ser inicializado con el current weather y no con otra cosa.
    init(model: CurrentWeather) {
        
        let roundedTemperature = Int(model.temperature)
        self.temperature = "\(roundedTemperature)º"
        
        let humidityPercentValue = Int(model.humidity * 100)
        self.humidity = "\(humidityPercentValue)%"
        
        let precipitationProbabilityValue = Int(model.precipitationProbability * 100)
        self.precipitationProbability = "\(precipitationProbabilityValue)%"
        
        self.summary = model.summary
        
        let weatherIcon = WeatherIcon(iconString: model.icon)
        self.icon = weatherIcon.image
        
    }
    
    
    // this class Simple object that formats data
}
