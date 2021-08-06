//
//  ContentView.swift
//  MoonShot2
//
//  Created by Артем Хлопцев on 01.08.2021.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var showingDifferentTypes = true
    var body: some View {
        NavigationView {
            List(missions) {mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: astronauts)) {
                    Image(mission.image).resizable().scaledToFit().frame(width: 44, height: 44)
                    VStack(alignment: .leading) {
                        Text(mission.displayName).font(.headline)
                        if showingDifferentTypes {
                            Text(mission.formattedLaunchDate)
                        } else {
                            Text(mission.missionNames)
                        }
                    }
                }
            }.navigationBarTitle("MoonShot").navigationBarItems(trailing: Button("show \(showingDifferentTypes ? "names": "date")") {
                self.showingDifferentTypes.toggle()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
