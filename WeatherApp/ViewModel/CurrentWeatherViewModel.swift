//
//  CurrentWeatherViewModel.swift
//  WeatherApp
//
//  Created by pc on 28.08.2022.
//

import Foundation

class CurrentWeatherViewModel {
    var currentWeatherData: CurrentWeather?
    var weatherService = WeatherService()
    
    private var currentWeatherInfoViewModel: CurrentWeatherInfoViewModel = CurrentWeatherInfoViewModel(iconText: "", temperatureText: "")
    
    func getWeatherData(latitudeValue: Double, longitudeValue: Double){
        weatherService.getWeather(latitude: latitudeValue, longitude: longitudeValue) { result in
                switch result {
                case .success(let response):
                    self.createData(currentWeatherData: response.current!)
                    //self.reloadTableView?()
                case .failure(let error):
                    print(error)
                }
        }
    }
    
    func getCurrentWeatherViewModel() -> CurrentWeatherInfoViewModel {
        return currentWeatherInfoViewModel
    }
    
    func createData(currentWeatherData: CurrentWeather){
        self.currentWeatherData = currentWeatherData
        let currentWeatherViewModel = CurrentWeatherInfoViewModel(iconText: currentWeatherData.weather!.first!.icon!, temperatureText: String(currentWeatherData.temp!))
        currentWeatherInfoViewModel = currentWeatherViewModel
    }
}

struct CurrentWeatherInfoViewModel {
    let iconText: String
    let temperatureText: String
}

