//
//  ModelTeams.swift
//  sportsApp
//
//  Created by ahmed rabie on 23/06/2022.
//

import Foundation
struct TeamsModel: Codable {

    let teams: [Teams]
}

struct Teams: Codable {

    let strTeamBadge: String?
    let strTeam: String?
    let intFormedYear: String?
    let strLeague: String?
    let strStadium: String?
    let strDescriptionEn: String?

}
