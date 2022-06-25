//
//  ViewModel.swift
//  sportsApp
//
//  Created by ahmed rabie on 22/06/2022.
//

import Foundation
class HomeViewModel {
    var sportsArray: [Sport]? {
        didSet{
            bindingData(sportsArray, nil)
        }
    }
    var error: Error? {
        didSet{
            bindingData(nil, error)
        }
    }
     
    let apiService: ApiService
    var bindingData: (([Sport]?, Error?) -> Void) = { _ , _ in}
    
    init(apiService: ApiService = NetworkManager()) {
        self.apiService = apiService
    }
    
    
    func fetchData()
    {
        apiService.fetchSports(){ sports, error in
            if let sports = sports {
                self.sportsArray = sports
            }
            if let error = error {
                self.error = error
            }
        }
    }
}
