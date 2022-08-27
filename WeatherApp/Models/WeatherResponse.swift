//
//  Weather.swift
//  WeatherApp
//
//  Created by pc on 26.08.2022.
//

import Foundation

struct WeatherResponse: Codable {
    let lat: Double?
    let lon: Double?
    let timezone: String?
    let timezone_offset: Int?
    let current: CurrentWeather?
    let daily: [DailyWeather]?
}
