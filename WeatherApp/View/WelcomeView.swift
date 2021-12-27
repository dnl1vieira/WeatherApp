//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Daniel Vieira on 26/12/21.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack{
            VStack(spacing: 20) {
                
                Text("Como está o tempo hoje?")
                    .bold().font(.title)
                
                Text("Por favor, compartilhe sua localização para que possamos pegar o clima da sua região")
                
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
    
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
