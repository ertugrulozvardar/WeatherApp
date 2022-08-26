//
//  FeelsLike.swift
//  WeatherApp
//
//  Created by pc on 26.08.2022.
//

import Foundation

struct FeelsLike: Codable {
    let day: Double?
    let night: Double?
    let eve: Double?
    let morn: Double?
    
    enum CodingKey: String {
        case day
        case night
        case eve
        case morn
    }
}
