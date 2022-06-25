//
//  URL.swift
//  sportsApp
//
//  Created by ahmed rabie on 22/06/2022.
//

import Foundation
struct urlServices {
    var endPoint : String = ""
    var url: String {
      return "https://www.thesportsdb.com/api/v1/json/2/\(endPoint)"
    }
   
}

// (1- V1)https://www.thesportsdb.com/api/v1/json/2/all_sports.php

//(2-V2)"https://www.thesportsdb.com/api/v1/json/2/search_all_leagues.php?s=Soccer

//(3-V3,1.2)"https://www.thesportsdb.com/api/v1/json/2/eventsseason.php?id=4617

//(v3.3)"https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=English%20Premier%20League

enum EndPoint: String {
    case allSports = "all_sports.php"
     //FirstView
    
    case allLeagues = "search_all_leagues.php?s=Soccer"
     //SecondView
    
    case allEventsSeason = "eventsseason.php?id=4617"
    //ThirdView1.2
    
    case allTeams = "search_all_teams.php?l=English%20Premier%20League"
    //ThirdView3
}





