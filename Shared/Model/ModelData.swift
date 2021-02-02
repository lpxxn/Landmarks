//
//  ModelData.swift
//  Landmarks
//
//  Created by li on 2021/2/2.
//

import Foundation


var landmarks: [Landmark] = load("landmarkData.json")

func load<T:Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Could't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't \(filename) frommain bundle in main bundle: \n\(error)")
    }
    print("data\(data)")
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self): \n \(error)")
    }
}
