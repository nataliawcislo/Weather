//
//  ContentView.swift
//  Shared
//
//  Created by Natalia Wcislo on 13.05.23.
//

import SwiftUI

struct ContentView: View {
    let strings = ["1234", "5678"]
    @State var tasks = [WeatherModel]()

    var body: some View {
        ScrollView{
            
            VStack{
                Text("Localizacja").font(.title)
//                Text(task)
                Spacer()
                Spacer()
                Spacer()
                Text("data").font(.title)
                Text("temp akt").font(.largeTitle).padding()
            }.padding()

            HStack{
                Text("min:")
                Spacer()
                Text("max: ")
            }.padding()

            VStack{
                HStack{
                    Text("Data")
                    HStack{
                        Spacer()
                        Text("min:")
                        Spacer()
                        Text("max: ")                    }
                }
            }.padding()
            
            
            VStack{
                ForEach(tasks, id: \.self ) { item in
                    VStack(alignment: .leading) {
                        Text("\(item.daily.temperature2MMin)")
                            .font(.headline)
                    }
                }
            }
        }
        .onAppear(perform: WeatherService().getDate)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
