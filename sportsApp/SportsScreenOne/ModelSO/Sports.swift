//
//  Sports.swift
//  sportsApp
//
//  Created by ahmed rabie on 22/06/2022.
//

import Foundation
struct Sports: Codable {
    let sports: [Sport]?
}

// MARK: - Sport
struct Sport: Codable {
    let idSport, strSport: String
    let strFormat: String
    let strSportThumb: String
    let strSportIconGreen: String
    let strSportDescription: String
}
