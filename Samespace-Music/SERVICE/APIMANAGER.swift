//
//  APIService.swift
//  Samespace-Music
//
//  Created by AMAN K.A on 24/01/24.
//


import Foundation
import UIKit

class APIService {
    static let shared = APIService()
    
    private let urlSession: URLSession
    
    private init() {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        self.urlSession = URLSession(configuration: config)
    }
    
    func fetchMusicData(completion: @escaping (Results) -> Void) {
        let urlString = "https://cms.samespace.com/items/songs"
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = urlSession.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let data = data,
               let result = try? JSONDecoder().decode(Results.self, from: data)
            {
                completion(result)
            }
        }
        task.resume()
    }
    
    func fetchCoverImage(for coverImageID: String, completion: @escaping (UIImage?) -> Void) {
        let urlString = "https://cms.samespace.com/assets/\(coverImageID)"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        let task = urlSession.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                return
            }
            
            if let data = data {
                DispatchQueue.main.async {
                    completion(UIImage(data: data))
                }
            }
        }
        task.resume()
    }
}
