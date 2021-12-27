//
//  ContentView.swift
//  WeatherApp
//
//  Created by Daniel Vieira on 25/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    
    var body: some View {
        
        VStack{
            if let location = locationManager.location {
                if let weather = weather {
                    WeathersView(weather: weather)
                }else {
                    LoadingView()
                        .task {
                            do {
                                try await weather = weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Erro ao carregar clima: \(error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView().environmentObject(locationManager)
                }
            }
            
        }
        .background(Color(hue: 0.982, saturation: 0.927, brightness: 0.314))
        .preferredColorScheme(.dark)
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
