//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by pc on 27.08.2022.
//

import Foundation
import UIKit

class WeatherViewModel {
    
    var dailyWeatherData: [DailyWeather] = [DailyWeather]()
    var weatherService = WeatherService()
    var reloadTableView: (()->())?
    var showError: (()->())?
    
    private var cellViewModels: [WeatherConditionTableCellViewModel] = [WeatherConditionTableCellViewModel]() {
        didSet {
            self.reloadTableView?()
        }
    }
    
    func getWeatherData(latitudeValue: Double, longitudeValue: Double){
        weatherService.getWeather(latitude: latitudeValue, longitude: longitudeValue) { result in
                switch result {
                case .success(let response):
                    self.createCell(dailyWeatherData: response.daily!)
                    self.reloadTableView?()
                case .failure(let error):
                    print(error)
                    self.showError?()
                }
            }
    }
    
    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    func getCellViewModel( at indexPath: IndexPath ) -> WeatherConditionTableCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    func createCell(dailyWeatherData: [DailyWeather]){
        self.dailyWeatherData = dailyWeatherData
        var vms = [WeatherConditionTableCellViewModel]()
        for weatherData in dailyWeatherData {
            vms.append(WeatherConditionTableCellViewModel(dayText: String(weatherData.dt!), maxTemperatureText: String(weatherData.temp!.max!), minTemperatureText: String(weatherData.temp!.min!)))
        }
        cellViewModels = vms
    }
}

struct WeatherConditionTableCellViewModel {
    let dayText: String
    let maxTemperatureText: String
    let minTemperatureText: String
}
