//
//  Mission.swift
//  MoonShot2
//
//  Created by Артем Хлопцев on 01.08.2021.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    let id: Int
    let crew: [CrewRole]
    let launchDate: Date?
    let description: String
    var displayName: String {
        "Apollo \(id)"
    }
    var image: String {
        "apollo\(id)"
    }
    var formattedLaunchDate: String  {
        if let launchDate = self.launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        } else {
            return "N/A"
        }
    }
    var missionNames: String {
        var names = [String]()
        for member in crew {
            names.append(member.name.capitalized)
        }
        return names.joined(separator: ", ")
    }
}
