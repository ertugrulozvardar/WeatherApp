//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by pc on 26.08.2022.
//

import Foundation

struct CurrentWeather: Codable {
    let dt: Int?
    let sunrise: Int?
    let sunset: Int?
    let temp: Double?
    let feels_like: Double?
    let pressure: Int?
    let humidity: Int?
    let dew_point: Double?
    let uvi: Double?
    let clouds: Int?
    let visibility: Int?
    let wind_speed: Double?
    let wind_deg: Int?
    let wind_gust: Double?
    let weather: [WeatherDetail]?
    
    enum CodingKey: String {
        case dt
        case sunrise
        case sunset
        case temp
        case feels_like
        case pressure
        case humidity
        case dew_point
        case uvi
        case clouds
        case visibility
        case wind_speed
        case wind_deg
        case wind_gust
        case weather
    }
}
