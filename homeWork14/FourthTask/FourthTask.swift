//
//  FourthTask.swift
//  homeWork14
//
//  Created by Dmitriy Lee on 08.03.2021.
//

import UIKit
import RealmSwift

class Weather: Object {
    @objc dynamic var realmCityName = ""
    @objc dynamic var realmWeather = ""
    
}

class FourthTask: UIViewController {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    
    
    static let shared = FourthTask()
    

    private let realm = try! Realm()
    
    let todayWeather = TodayWeatherLoader()
    
    let weather = Weather()

    override func viewDidLoad() {
        super.viewDidLoad()
        todayWeather.delegate = self
        todayWeather.loadTodayWeather()
        print(realm.objects(Weather.self))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let realmResults = realm.objects(Weather.self)
        
        self.cityNameLabel.text = realmResults.last?.realmCityName
        self.weatherLabel.text = realmResults.last?.realmWeather
        
        
    }
}

extension FourthTask: TodayWeatherDelegate {
    func loaded(weatherLoader: TodayWeatherLoader) {
        
    
        self.cityNameLabel.text = todayWeather.cityName
        self.weatherLabel.text = "\(Int(todayWeather.weather - 274.15)) °C"
        
        if cityNameLabel.text != "" {
            try! realm.write {
                weather.realmCityName = cityNameLabel.text!
                weather.realmWeather = weatherLabel.text!
                realm.add(weather)
                print(realm.objects(Weather.self))
            }
        } else {
            
        }
    }
}

