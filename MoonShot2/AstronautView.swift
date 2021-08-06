//
//  AstronautView.swift
//  MoonShot2
//
//  Created by Артем Хлопцев on 01.08.2021.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let mission: Mission
    let missions: [Mission] = Bundle.main.decode("missions.json")
    var allMissionsOfAstronaut = [String]()
    var body: some View {
        GeometryReader {geo in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id).resizable().scaledToFit().frame(maxWidth: geo.size.width)
                    Divider()
                    Text(self.astronaut.description).padding()
                    Divider()
                    Text("All missions of this astronaut: ").fontWeight(.medium).font(.headline).foregroundColor(.primary)
                    ForEach(allMissionsOfAstronaut, id: \.self) {all in
                        HStack {
                            Divider().frame(width: 20, height: 20)
                            Text("\(all)").fontWeight(.regular).foregroundColor(.secondary)
                        }
                        
                    }
                }
                
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
    init(mission: Mission, astronaut: Astronaut) {
        self.mission = mission
        self.astronaut = astronaut
        for i in missions {
            for j in i.crew {
                if j.name == astronaut.id {
                    allMissionsOfAstronaut.append(i.displayName)
                }
            }
        }
    }
}
struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static var previews: some View {
        AstronautView(mission: missions[0], astronaut: astronauts[0])
    }
}
