//
//  DataModel.swift
//  Assignment-test
//
//  Created by Swayam on 26/10/26.
//

import Foundation

struct WeatherData: Codable {
    let latitude: Double
    let longitude: Double
    let timezoneabrev: String
    
    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
        case timezoneabrev = "timezone_abbreviation"
    }
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.latitude = try container.decode(Double.self, forKey: .latitude)
        self.longitude = try container.decode(Double.self, forKey: .longitude)
        self.timezoneabrev = try container.decode(String.self, forKey: .timezoneabrev)
    }
    
}

struct RandomFactData: Codable {
    
}

struct DogImageData: Codable {
    
}
