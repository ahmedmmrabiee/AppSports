//
//  Leagues.swift
//  sportsApp
//
//  Created by ahmed rabie on 22/06/2022.
//

import Foundation
// MARK: - Legs
struct Leagues: Codable {
    let countries: [League]?

}

// MARK: - League
struct League: Codable {
  var  idLeague,idSoccerXML,idAPIfootball,strSport,strLeague,strLeagueAlternate,strYoutube,strBadge : String?
}






