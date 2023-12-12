//
//  ContentView.swift
//  MapActionSheetDemo
//
//  Created by Sharvari on 2023-12-11.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @Environment(\.openURL) private var openURL
    @State var openSheet = false
    @State var availableMaps: [MapApps] = []

    private var location = CLLocation(latitude: 40.7128, longitude: 74.0060)

    var body: some View {
        VStack {
            Button(action: { onButtonClick() }, label: {
                Text("Open New York in the Map")
                    .font(.body)
                    .padding()
                    .foregroundStyle(.white)
                    .background(.primary)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
            })
        }
        .onAppear(perform: {
            availableMaps = availableMapApps(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        })
        .confirmationDialog("Map Dialog", isPresented: $openSheet) {
            ForEach(availableMaps, id: \.self){ item in
                Link(item.title,destination: URL(string: item.link)!)
                    .font(.title2)
                    .foregroundStyle(.red)
            }
        } message: {
            Text("Choose the map you want to use?")
                .font(.title)
        }
    }

    private func onButtonClick(){
        if availableMaps.count > 1{
            openSheet.toggle()
        }else{
            if let link = availableMaps.first?.link{
                if let url = URL(string: link) {
                    openURL(url)
                }
            }
        }
    }
}

extension View {
    internal func availableMapApps(latitude: Double, longitude: Double) -> [MapApps]{
        let maps: [MapApps] = [.google(latitude, longitude), .apple(latitude, longitude)]
        var availableApps: [MapApps] = []
        for map in maps {
            if UIApplication.shared.canOpenURL(URL(string: map.url)!){
                print("Available => ", map)
                availableApps.append(map)
            }
        }
        return availableApps
    }
}

#Preview {
    ContentView()
}
