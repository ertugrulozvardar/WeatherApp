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
    let moonrise: Date?
    let moonset: Date?
    let moon_phase: Double?
    let temp: Temperature?
    let feels_like: FeelsLike?
    let pressure: Int?
    let humidity: Int?
    let dew_point: Double?
    let wind_speed: Double?
    let wind_deg: Int?
    let wind_gust: Double?
    let weather: [WeatherDetail]?
    let clouds: Int?
    let pop: Double?
    let uvi: Double?
    
    
    enum CodingKey: String {
        case dt
        case sunrise
        case sunset
        case moonrise
        case moonset
        case moon_phase
        case temp
        case feels_like
        case pressure
        case humidity
        case dew_point
        case wind_speed
        case wind_deg
        case wind_gust
        case weather
        case clouds
        case pop
        case uvi
    }
    
    var date: NSDate? {
        return NSDate(timeIntervalSince1970: Double(dt ?? 0))
    }
    
    func stringFromDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy HH:mm" //yyyy
        return formatter.string(from: date)
    }
}
