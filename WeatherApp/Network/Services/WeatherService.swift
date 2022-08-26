//
//  WeatherService.swift
//  WeatherApp
//
//  Created by pc on 26.08.2022.
//

import Foundation

protocol WeatherServiceProtocol {
    func getWeather(latitude: Double, longitude: Double, completion: @escaping (Result<WeatherResponse, NetworkError>) -> Void)
}

struct WeatherService: WeatherServiceProtocol {
    
    private let network = Network()
    let scheme = "https"
    let host = "api.openweathermap.org"
    let path = "/data/2.5/onecall"
    let unit_val = "metric"
    let exclude_val = "hourly,minutely"
    let weatherAPIKey = "8ddadecc7ae4f56fee73b2b405a63659"
    

    
    func getWeather(latitude: Double, longitude: Double, completion: @escaping (Result<WeatherResponse, NetworkError>) -> Void) {
        var url: URL? {
            var components = URLComponents()
            components.scheme = scheme
            components.host = host
            components.path = path
            components.queryItems = [
                URLQueryItem(name: "lat", value: String(latitude)),
                URLQueryItem(name: "lon", value: String(longitude)),
                URLQueryItem(name: "units", value: unit_val),
                URLQueryItem(name: "exclude", value: exclude_val),
                URLQueryItem(name: "appid", value: weatherAPIKey)]
            return components.url
        }
        let urlRequest = URLRequest(url: url!)
        network.performRequest(request: urlRequest, completion: completion)
    }
    
}
