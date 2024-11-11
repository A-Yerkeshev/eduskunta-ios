//
//  ModelData.swift
//  Eduskunta-iOS
//
//  Created by Arman Yerkeshev on 4.11.2024.
//

import Foundation

@Observable
class ModelData {
    var members: [Member] = load("mps.json")
    var parties: [String: [Member]] {
        Dictionary(
            grouping: members,
            by: { $0.party }
        )
    }
    var favouriteParties: [String] = []
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {fatalError("Couldn't find \(filename) in main bundle.")}
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
