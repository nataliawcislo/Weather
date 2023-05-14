//
//  WeatherService.swift
//  Weather
//
//  Created by Natalia Wcislo on 13.05.23.
//

import Foundation

class WeatherService : ObservableObject{
    
    func getDate(){
         let url = "https://api.open-meteo.com/v1/forecast?latitude=52.40&longitude=13.07&daily=weathercode,temperature_2m_max,temperature_2m_min&current_weather=true&past_days=1&timezone=Europe%2FBerlin"
         
         URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            
            guard let data = data, error == nil else{
                print("Something went wrong")
                return
            }

            var result: WeatherModel?
            do {
                result = try JSONDecoder().decode(WeatherModel.self, from: data)
            }
            catch {
                print("Convert Error: \(error.localizedDescription)")
            }
            guard let json = result else{
                return 
            }
            //Potsdam: Longitude: 13.063561 Latitude: 52.391842
            print("Longitude: \(json.longitude) Latitude:  \(json.latitude) ")
            print("Current weather, Time: \(json.currentWeather.time), Temperature: \(json.currentWeather.temperature)")
            print("Max temperature  for next 7 days\(json.daily.temperature2MMax)")
            print("temperature2MMin for next 7 days \(json.daily.temperature2MMin)")

        }).resume()
    }
}

