//
//  ViewModelTeams.swift
//  sportsApp
//
//  Created by ahmed rabie on 23/06/2022.
//

import Foundation
class TeamsViewModel
{
    var teamsArray: [Teams]? {
        didSet{
            bindingData(teamsArray, nil)
        }
    }
    var error: Error? {
        didSet{
            bindingData(nil, error!)
        }
    }
    let apiServiceLegTeams: ApiServiceLegTeams
    var bindingData: (([Teams]?, Error?) -> Void) = { _ , _ in}
    
    init(apiServiceLegTeams: ApiServiceLegTeams = NetworkManagerLegTeams()) {
        self.apiServiceLegTeams = apiServiceLegTeams
    }
    func fetchData()
    {
        apiServiceLegTeams.fetchTeams() {teams, error in
            if let teams = teams {
                self.teamsArray = teams
            }
            if let error = error {
                self.error = error
            }
        }
    }
}
