//
//  ViewController.swift
//  Stormy
//
//  Created by Pasan Premaratne on 2/15/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var currentHumidityLabel: UILabel!
    @IBOutlet weak var currentPrecipitationLabel: UILabel!
    @IBOutlet weak var currentWeatherIcon: UIImageView!
    @IBOutlet weak var currentSummaryLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
  //  fileprivate let darkSkyApiKey = "12d26f016953bd21cbf75de28a41872a"
    
    let client = DarkSkyAPIClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCurrentWeather()
        
        // Do any additional setup after loading the view, typically from a nib.
        
   /*
        // APUNTESSSS
        
        let currentWeather = CurrentWeather(temperature: 85.0, humidity: 0.8, precipitationProbability: 0.1, summary: "Hot!", icon: "clear-day")
        let currentWeatherViewModel = CurrentWeatherModel(model: currentWeather)
        displayWeather(using: currentWeatherViewModel)
        
        let base = URL(string: "https://api.darksky.net/forecast/\(darkSkyApiKey)/")
        guard let forecastUrl = URL(string: "37.8267,-122.4233", relativeTo: base) else {return}
        
        // bad way of doing the call to de server
       /* let weatherData = try! Data(contentsOf: forecastUrl!)
        let json = try! JSONSerialization.jsonObject(with: weatherData, options: [])
        print(json)*/
        
        //To stop blocking the main thread and write concurrent networking code, we are going to use ther URL sessions set of classes, para obtener una resuesta asincrona.
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        // create a HTTP request object con un GET by default
        let request = URLRequest(url: forecastUrl)
        // Next bit of code defines a task during a session 
        let dataTask = session.dataTask(with: request) {data, response, error in
            // dentro del datatask estamos en un background thread,
             // la diferencia de crear un datatask con el codigo anterior es que esta tarea asyncrona no es llevada a cabo en el main thread.
            //cuando la task es terminada usamo un closure como mecanismo de callback
            print(data)
        
        }
        
        // para ejecutar
        dataTask.resume()
        
       
    
       /* , completionHandler: (Data?, URLResponse?, Error?) -> Void
 es lo mismo que el siguiente trailing closure:
 {data, response error in} */
        // A completion Handler is a closure which defines logic of what we want to do after the request is completed.
        // We use a closure because when we write asycronous code, because ot happens in the background, we cant control when our code is done being executed. For this reason, we can use a closure, because a closure captures references to all the objects we need and executes the logic at later time. 
        // Closures used in this way are called callbacks: The data task is executed and a then when its done it calls back to a closure and executes the body.
 
 */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayWeather(using viewModel: CurrentWeatherModel) {
        currentTemperatureLabel.text = viewModel.temperature
        currentHumidityLabel.text = viewModel.humidity
        currentPrecipitationLabel.text = viewModel.precipitationProbability
        currentSummaryLabel.text = viewModel.summary
        currentWeatherIcon.image = viewModel.icon
        
    }
    
    
    @IBAction func getCurrentWeather() {
        
        toggleRefreshAnimation(on: true)
        
        let coordinate = Coordinate(latitude: 37.8267, longitude: -122.4233)
        
        client.getCurrentWeather(at: coordinate) { [unowned self] currentWeather, error in
            if let currentWeather = currentWeather {
                let viewModel = CurrentWeatherModel(model: currentWeather)
                self.displayWeather(using: viewModel)
                self.toggleRefreshAnimation(on: false)
            }
        }
    }
    
    func toggleRefreshAnimation(on: Bool) {
        refreshButton.isHidden = on
        
        if on {
            activityIndicator.startAnimating()
        }
        else{
            activityIndicator.stopAnimating()
        }
    }
}
















