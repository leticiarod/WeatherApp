//
//  DarkSkyAPIClient.swift
//  Stormy
//
//  Created by Leticia Rodriguez on 7/1/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class DarkSkyAPIClient {
    fileprivate let apiKey = "12d26f016953bd21cbf75de28a41872a"
    
    lazy var baseUrl: URL = {
        return URL(string: "https://api.darksky.net/forecast/\(self.apiKey)/")!
    }()
    
    let downloader = JSONDownloader()
    
    typealias CurrentWeatherCompletionHandler = (CurrentWeather?, DarkSkyError?) -> Void
    
    func getCurrentWeather(at coordinate: Coordinate, completionHandler completion: @escaping CurrentWeatherCompletionHandler)  {
        
        guard let url = URL(string: coordinate.description, relativeTo: baseUrl) else {
            completion(nil, .invalidURL)
            return // because guard statements needs to exit the current scope
        }
        
        let request = URLRequest(url: url)
        
        let task = downloader.JSONTask(with: request) { json, error in
            
            DispatchQueue.main.async {
                guard let json = json else {
                    completion(nil, error)
                    return
                }
                
                guard let currentWeatherJson = json["currently"] as? [String: AnyObject], let currentWeather = CurrentWeather(json: currentWeatherJson) else {
                    completion(nil, .jsonParsingFailure)
                    return
                }
                
                completion(currentWeather, nil)
            }
            
            
        }
        
        task.resume()
    }
}
