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
    let text: String
    let source: String
    let sourceUrl: String
    let permalink: String
    
    enum CodingKeys: String, CodingKey {
        case sourceUrl = "source_url"
        case text
        case source
        case permalink
    }
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.sourceUrl = try container.decode(String.self, forKey: .sourceUrl)
        self.text = try container.decode(String.self, forKey: .text)
        self.source = try container.decode(String.self, forKey: .source)
        self.permalink = try container.decode(String.self, forKey: .permalink)
    }
}

struct DogImageData: Codable {
    let message: String
    let status: String
}
