//
//  WeatherDetail.swift
//  WeatherApp
//
//  Created by pc on 26.08.2022.
//

import Foundation

struct WeatherDetail: Identifiable, Codable {
    let id: Int?
    let main: String?
    let description: String?
    let icon: String?
    
    enum CodingKey: String {
        case id
        case main
        case description
        case icon
    }
}
