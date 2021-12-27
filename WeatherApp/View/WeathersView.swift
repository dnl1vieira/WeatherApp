//
//  WeathersView.swift
//  WeatherApp
//
//  Created by Daniel Vieira on 26/12/21.
//

import SwiftUI

struct WeathersView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            VStack {
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text(weather.name!)
                        .bold().font(.title)
                    
                    Text("Hoje, \(Date().formatted(.dateTime))").fontWeight(.light)
                    
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    
                    HStack {
                        
                        VStack(spacing: 20){
                            
                            Image(systemName: "cloud")
                                .font(.system(size: 40))
                            
                            Text(weather.weather![0].main!)
                            
                        }.frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text((weather.main?.feelsLike?.roundDouble())! + "º")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                        
                    }
                    
                    Spacer().frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https:cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:350)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                    
                }.frame(maxWidth: .infinity)
                
            }.padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack{
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Tempo agora")
                        .bold().padding(.bottom)
                    
                    HStack{
                        WeatherRow(logo: "thermometer", name: "Temperatura Min", value: ((weather.main?.tempMin)?.roundDouble())! + "º")
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Temperatura Max", value: ((weather.main?.tempMax)?.roundDouble())! + "º")
                    }
                    
                    HStack{
                        WeatherRow(logo: "wind", name: "Velocidade Vento", value: ((weather.wind?.speed)?.roundDouble())! + " m/s")
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Umidade", value: (weather.main?.humidity?.roundInt())! + "%").padding(.trailing)
                    }
                    
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.bottom, 20)
                    .foregroundColor(Color(hue: 0.982, saturation: 0.927, brightness: 0.314))
                    .background(.white)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
            }
            
        }.edgesIgnoringSafeArea(.bottom)
            .background(Color(hue: 0.982, saturation: 0.927, brightness: 0.314))
            .preferredColorScheme(.dark)
    }
}

struct WeathersView_Previews: PreviewProvider {
    static var previews: some View {
        WeathersView(weather: previewWeather)
    }
}
