//
//  Temperature.swift
//  WeatherApp
//
//  Created by pc on 26.08.2022.
//

import Foundation

struct Temperature: Codable {
    let day: Double?
    let min: Double?
    let max: Double?
    let night: Double?
    let eve: Double?
    let morn: Double?
}
