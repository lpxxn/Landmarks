//
//  Landmark.swift
//  Landmarks
//
//  Created by li on 2021/2/2.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latiude,
            longitude: coordinates.longitude
        )
    }
    
    
    struct Coordinates: Hashable, Codable {
        var latiude: Double
        var longitude: Double
    }
}
