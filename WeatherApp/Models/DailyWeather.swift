//
//  DailyWeather.swift
//  WeatherApp
//
//  Created by pc on 26.08.2022.
//

import Foundation

struct DailyWeather: Codable {
    let dt: Int?
    let sunrise: Int?
    let sunset: Int?
    let moonrise: Int?
    let moonset: Int?
    let moon_phase: Double?
    let temp: Temperature?
    let feels_like: FeelsLike?
    let pressure: Int?
    let humidity: Int?
    let dew_point: Double?
    let wind_speed: Double?
    let wind_deg: Int?
    let wind_gust: Double?
    let weather: WeatherDetail?
    let clouds: Int?
    let pop: Double?
    let rain: Double?
    let uvi: Double?
    
}
