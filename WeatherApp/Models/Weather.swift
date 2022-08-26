//
//  Weather.swift
//  WeatherApp
//
//  Created by pc on 26.08.2022.
//

import Foundation

struct Weather: Codable {
    let current: CurrentWeather?
    let daily: [DailyWeather]?
}
