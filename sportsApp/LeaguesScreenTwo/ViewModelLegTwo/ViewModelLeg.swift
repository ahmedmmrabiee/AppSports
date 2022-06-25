//
//  ViewModelLeg.swift
//  sportsApp
//
//  Created by ahmed rabie on 22/06/2022.
//

import Foundation
class LeaguesViewModel {
    var leaguesArray: [League]? {
        didSet{
            bindingData(leaguesArray, nil)
        }
    }
    var error: Error? {
        didSet{
            bindingData(nil, error)
        }
    }
     
    let apiServiceLeg: ApiServiceLeg
    var bindingData: (([League]?, Error?) -> Void) = { _ , _ in}
    
    init(apiServiceLeg: ApiServiceLeg = NetworkManagerLeg()) {
        self.apiServiceLeg = apiServiceLeg
    }
    
    
    func fetchData()
    {
        apiServiceLeg.fetchLeagues() {leagues, error in
            if let leagues = leagues {
                self.leaguesArray = leagues
            }
            if let error = error {
                self.error = error
            }
        }
    }
}
