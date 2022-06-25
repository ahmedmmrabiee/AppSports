//
//  ApiService.swift
//  sportsApp
//
//  Created by ahmed rabie on 22/06/2022.
//

import Foundation
//Firstview
protocol ApiService {
    func fetchSports(completion: @escaping (([Sport]? , Error?) -> Void) )
  
}

//SecondView
protocol ApiServiceLeg {
    func fetchLeagues(completion: @escaping (([League]? , Error?) -> Void) )
}
//ThirdView
protocol ApiServiceLegLastestEvents {
    func fetchLatestEvents(completion: @escaping (([Eventes]? , Error?) -> Void) )
}

/*protocol ApiServiceLegComingEvents {
    func fetchComingEvents(endPoint: String , completion: @escaping (([League]? , Error?) -> Void) )
}
*/
protocol ApiServiceLegTeams{
    func fetchTeams(completion: @escaping (([Teams]? , Error?) -> Void) )
}
