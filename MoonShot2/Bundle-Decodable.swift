//
//  Bundle-Decodable.swift
//  MoonShot2
//
//  Created by Артем Хлопцев on 01.08.2021.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Can't read a \(file) from a bundle.")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Can't convert \(file) to data.")
        }
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Can't decode \(file).")
        }
        return loaded
    }
}
