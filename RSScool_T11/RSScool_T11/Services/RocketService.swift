//
//  RocketService.swift
//  RSScool_T11
//
//  Created by Маргарита Жучик on 10.09.21.
//

import Foundation
import UIKit

enum LoadData: String {
    case rockets = "https://api.spacexdata.com/v4/rockets"
    case launches = "https://api.spacexdata.com/v5/launches"
}

struct LoadService {
    var queue = OperationQueue()
    var operations: Dictionary<String, [Operation]> = [:]
    
    func loadRockets(completion: @escaping([RocketModel]?, Error?) -> Void){
        guard let urlFromString = URL(string: LoadData.rockets.rawValue) else {return}
        
        URLSession.shared.dataTask(with: urlFromString) { data, response, error in
            if (error != nil) || data == nil {
                print("Client error!")
                completion(nil, error)
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                dateFormatter.locale = Locale(identifier: "en_US")
                dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                let rocketsList = try decoder.decode([RocketModel].self, from: data!)
                completion(rocketsList, nil)
                
            } catch {
                print("JSON error: \(error.localizedDescription)")
                completion(nil, error)
                return 
            }
        }.resume()
    }
    
    func loadLaunches(completion: @escaping([LaunchModel]?, Error?) -> Void){
        guard let urlFromString = URL(string: LoadData.launches.rawValue) else {return}
        
        URLSession.shared.dataTask(with: urlFromString) { data, response, error in
            if (error != nil) || data == nil {
                print("Client error!")
                completion(nil, error)
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000Z"
                dateFormatter.locale = Locale(identifier: "en_US")
                dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                let launchesList = try decoder.decode([LaunchModel].self, from: data!)
                completion(launchesList, nil)
                
            } catch {
                print("JSON error: \(error.localizedDescription)")
                completion(nil, error)
                return
            }
        }.resume()
    }
    
    mutating func loadImageForURL(_ url: String, completion: @escaping(UIImage) -> Void) {
        cancelDownloadingForURL(url: url)
        let operation = ImageDownloadOperation()
        operation.initWithUrl(url)
        operations[url] = [operation]
        operation.completion = completion
        queue.addOperation(operation)
    }
    
    func cancelDownloadingForURL(url: String) {
        guard let urlOperations = operations[url] else { return }
        for operation in urlOperations {
            operation.cancel()
        }
    }
}
