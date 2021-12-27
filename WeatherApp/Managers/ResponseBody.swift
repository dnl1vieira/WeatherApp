//
//  ResponseBody.swift
//  WeatherApp
//
//  Created by Daniel Vieira on 26/12/21.
//

import Foundation

// MARK: - ResponseBody
class ResponseBody: Codable {
    let coord: Coord?
    let weather: [Weather]?
    let base: String?
    let main: Main?
    let visibility: Int?
    let wind: Wind?
    let clouds: Clouds?
    let dt: Int?
    let sys: Sys?
    let timezone, id: Int?
    let name: String?
    let cod: Int?
    
    init(coord: Coord?, weather: [Weather]?, base: String?, main: Main?, visibility: Int?, wind: Wind?, clouds: Clouds?, dt: Int?, sys: Sys?, timezone: Int?, id: Int?, name: String?, cod: Int?) {
        self.coord = coord
        self.weather = weather
        self.base = base
        self.main = main
        self.visibility = visibility
        self.wind = wind
        self.clouds = clouds
        self.dt = dt
        self.sys = sys
        self.timezone = timezone
        self.id = id
        self.name = name
        self.cod = cod
    }
}

// MARK: - Clouds
class Clouds: Codable {
    let all: Int?
    
    init(all: Int?) {
        self.all = all
    }
}

// MARK: - Coord
class Coord: Codable {
    let lon, lat: Double?
    
    init(lon: Double?, lat: Double?) {
        self.lon = lon
        self.lat = lat
    }
}

// MARK: - Main
class Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double?
    let pressure, humidity: Int?
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
    
    init(temp: Double?, feelsLike: Double?, tempMin: Double?, tempMax: Double?, pressure: Int?, humidity: Int?) {
        self.temp = temp
        self.feelsLike = feelsLike
        self.tempMin = tempMin
        self.tempMax = tempMax
        self.pressure = pressure
        self.humidity = humidity
    }
}

// MARK: - Sys
class Sys: Codable {
    let type, id: Int?
    let country: String?
    let sunrise, sunset: Int?
    
    init(type: Int?, id: Int?, country: String?, sunrise: Int?, sunset: Int?) {
        self.type = type
        self.id = id
        self.country = country
        self.sunrise = sunrise
        self.sunset = sunset
    }
}

// MARK: - Weather
class Weather: Codable {
    let id: Int?
    let main, weatherDescription, icon: String?
    
    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
    
    init(id: Int?, main: String?, weatherDescription: String?, icon: String?) {
        self.id = id
        self.main = main
        self.weatherDescription = weatherDescription
        self.icon = icon
    }
}

// MARK: - Wind
class Wind: Codable {
    let speed: Double?
    let deg: Int?
    let gust: Double?
    
    init(speed: Double?, deg: Int?, gust: Double?) {
        self.speed = speed
        self.deg = deg
        self.gust = gust
    }
}
