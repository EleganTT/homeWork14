//
//  TodayWeatherLoader.swift
//  homeWork14
//
//  Created by Dmitriy Lee on 08.03.2021.
//

import Foundation

protocol TodayWeatherDelegate {
    func loaded(weatherLoader: TodayWeatherLoader)
}

class TodayWeatherLoader {
    var delegate: TodayWeatherDelegate?
    
    var cityName = String()
    var weather = Double()

    func loadTodayWeather() {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Almaty&appid=0fe9620bdbe8acdbf8230f533b039c3a")!
        let request = URLRequest(url:url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data,
               let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
               let jsonDict = json as? NSDictionary {
                let todayWeatherLoader = TodayWeatherLoader()
                if let city = jsonDict["name"] { self.cityName = city as! String }
                if let main = jsonDict["main"] as? NSDictionary {
                    if let weather = main["temp"] as? Double { self.weather = weather }
                }
                DispatchQueue.main.async {
                    self.delegate?.loaded(weatherLoader: todayWeatherLoader)
                }
            }
        }
        
        task.resume()
    }
}
