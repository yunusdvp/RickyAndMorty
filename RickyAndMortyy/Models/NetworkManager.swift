//
//  NetworkManager.swift
//  collecdeneme
//
//  Created by Yunus Emre ÖZŞAHİN on 10.04.2023.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from url: String, completion: @escaping (Data) -> Void) {
        guard let url = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("Error fetching data: no data received")
                return
            }
            
            completion(data)
        }.resume()
    }
}
