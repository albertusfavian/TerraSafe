//
//  Mountain.swift
//  TerraSafe
//
//  Created by Rony Fhebrian on 14/06/21.
//

import Foundation

struct Geometry: Decodable {
    let latitude: Float
    let longitude: Float
}

struct Mountain: Decodable {
    let title: String
    let elevation: Int
    let location: String
    let geometry: Geometry
}
