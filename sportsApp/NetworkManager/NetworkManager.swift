//
//  NetworkManager.swift
//  sportsApp
//
//  Created by ahmed rabie on 22/06/2022.
//

import Foundation
class NetworkManager: ApiService {
    
    
    func fetchSports(completion: @escaping (([Sport]?, Error?) -> Void)) {
        let endPoint = EndPoint.allSports.rawValue
        if let url = URL(string: urlServices(endPoint: endPoint).url){
            URLSession.shared.dataTask(with: url) { data , response , error in
                if let data = data {
                    let decodedArray: Sports! = convertFromJson(data: data)
                    completion(decodedArray.sports, nil)
                
                }
                if let error = error {
                    print(error.localizedDescription)
                }
            }.resume()
            
        }
      }
}

  


 class NetworkManagerLeg: ApiServiceLeg{
    func fetchLeagues(completion: @escaping (([League]?, Error?) -> Void)) {
        let endPoint = EndPoint.allLeagues.rawValue
        if let url = URL(string: urlServices(endPoint: endPoint).url){
             URLSession.shared.dataTask(with: url) { data , response , error in
                 if let data = data {
                     let decodedArray: Leagues! = convertFromJson(data: data)
                     completion(decodedArray.countries, nil)
                 
                 }
                 if let error = error {
                     print(error.localizedDescription)
                 }
             }.resume()
             
         }
    }
}
class NetworkManagerEvents: ApiServiceLegLastestEvents{
    func fetchLatestEvents(completion: @escaping (([Eventes]?, Error?) -> Void)) {
        let endPoint = EndPoint.allEventsSeason.rawValue
        if let url = URL(string: urlServices(endPoint: endPoint).url){
            URLSession.shared.dataTask(with: url) { data , response , error in
                if let data = data {
                    let decodedArray: EventsModel! = convertFromJson(data: data)
                    completion(decodedArray.events, nil)
                
                }
                if let error = error {
                    print(error.localizedDescription)
                }
            }.resume()
            
        }
    }
}

class NetworkManagerLegTeams: ApiServiceLegTeams{
    func fetchTeams(completion: @escaping (([Teams]?, Error?) -> Void)) {
        let endPoint = EndPoint.allTeams.rawValue
         if let url = URL(string: urlServices(endPoint: endPoint).url){
             URLSession.shared.dataTask(with: url) { data , response , error in
                 if let data = data {
                     let decodedArray: TeamsModel! = convertFromJson(data: data)
                     completion(decodedArray.teams, nil)
                 
                 }
                 if let error = error {
                     print(error.localizedDescription)
                 }
             }.resume()
             
         }
    }
}







/*
 class NetworkManagerLatestEvents: ApiServiceLegLatestEvents{
    func fetchLatestEvents(endPoint: String, completion: @escaping (([--------]?, Error?) -> Void)) {
         if let url = URL(string: urlServices(endPoint: endPoint).url){
             URLSession.shared.dataTask(with: url) { data , response , error in
                 if let data = data {
                     let decodedArray: -------! = convertFromJson(data: data)
                     completion(decodedArray.---------, nil)
                 
                 }
                 if let error = error {
                     print(error.localizedDescription)
                 }
             }.resume()
             
         }
    }
}

class NetworkManagerUpComingEvents: ApiServiceLegComingEvents{
    func fetchComingEvents(endPoint: String, completion: @escaping (([--------]?, Error?) -> Void)) {
         if let url = URL(string: urlServices(endPoint: endPoint).url){
             URLSession.shared.dataTask(with: url) { data , response , error in
                 if let data = data {
                     let decodedArray: -------! = convertFromJson(data: data)
                     completion(decodedArray.---------, nil)
                 
                 }
                 if let error = error {
                     print(error.localizedDescription)
                 }
             }.resume()
             
         }
    }
}

*/
