//
//  WeatherModel.swift
//  Weather
//
//  Created by Natalia Wcislo on 13.05.23.
//

import Foundation

////Response
//struct WeatherModel: Decodable {
//    let dailyWeather: DailyWeather
//    let currentWeather: CurrentWeather
//}
//
//struct CurrentWeather: Decodable {
//    let temperature: Double
//    let windspeed: Double
//    let winddirection: Double
//}
//
//struct DailyWeather: Decodable{
//    let time: [String]
//    let temperature_2m_max: [Double]
//    let temperature_2m_min: [Double]
// }


// MARK: - Welcome
struct WeatherModel: Decodable, Identifiable {
    var id = UUID()
    let latitude, longitude, generationtimeMS: Double
    let utcOffsetSeconds: Int
    let timezone, timezoneAbbreviation: String
    let elevation: Int
    let currentWeather: CurrentWeather
    let dailyUnits: DailyUnits
    let daily: Daily

    enum CodingKeys: String, CodingKey {
        case latitude, longitude
        case generationtimeMS = "generationtime_ms"
        case utcOffsetSeconds = "utc_offset_seconds"
        case timezone
        case timezoneAbbreviation = "timezone_abbreviation"
        case elevation
        case currentWeather = "current_weather"
        case dailyUnits = "daily_units"
        case daily
    }
}

// MARK: - CurrentWeather
struct CurrentWeather: Decodable, Identifiable {
    var id = UUID()
    let temperature: Double
    let windspeed, winddirection, weathercode, isDay: Int
    let time: String

    enum CodingKeys: String, CodingKey {
        case temperature, windspeed, winddirection, weathercode
        case isDay = "is_day"
        case time
    }
}

// MARK: - Daily
struct Daily: Decodable, Identifiable {
    var id = UUID()
    let time: [String]
    let weathercode: [Int]
    let temperature2MMax, temperature2MMin: [Double]

    enum CodingKeys: String, CodingKey {
        case time, weathercode
        case temperature2MMax = "temperature_2m_max"
        case temperature2MMin = "temperature_2m_min"
    }
}

// MARK: - DailyUnits
struct DailyUnits: Decodable, Identifiable {
    var id = UUID()
    let time, weathercode, temperature2MMax, temperature2MMin: String

    enum CodingKeys: String, CodingKey {
        case time, weathercode
        case temperature2MMax = "temperature_2m_max"
        case temperature2MMin = "temperature_2m_min"
    }
}
