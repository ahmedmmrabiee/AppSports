//
//  ViewModelLegDetails.swift
//  sportsApp
//
//  Created by ahmed rabie on 23/06/2022.
//

import Foundation
class EventsViewModel {
    var eventsArray: [Eventes]? {
        didSet{
           bindingData(eventsArray, nil)
        }
    }
    
    var error: Error? {
        didSet{
            bindingData(nil, error!)
        }
    }
    let apiServiceLegLastestEvents: ApiServiceLegLastestEvents
    var bindingData: (([Eventes]?, Error?) -> Void) = { _ , _ in}
    
    init(apiServiceLegLastestEvents: ApiServiceLegLastestEvents = NetworkManagerEvents()) {
        self.apiServiceLegLastestEvents = apiServiceLegLastestEvents
    }
    
        
    
    func fetchData()
    {
        apiServiceLegLastestEvents.fetchLatestEvents() {eventsMod, error in
            if let eventsMod = eventsMod {
                self.eventsArray = eventsMod
            }
            if let error = error {
                self.error = error
            }
        }
    }
}

