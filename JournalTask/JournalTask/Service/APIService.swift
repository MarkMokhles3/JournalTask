//
//  APIService.swift
//  JournalTask
//
//  Created by MarkFathy on 03/09/2024.
//

import Foundation

class APIService {
    
    private let apiKey = "xM0tj5aJrmPtyQNRFNJE1UVvfmNybp7e"
    private let baseURL = "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json"
    
    //Staic iConstant
    static let shared   = APIService()
    
    // MARK: - getArticles
    func getArticles(completion: @escaping(Swift.Result<ArticleResponse, APError>) -> Void){
        APIService.shared.request(url: baseURL + "?api-key=\(apiKey)", completed: completion)
    }
    
    // MARK: - APIService
    func request<T: Decodable>(url: String, completed: @escaping (Swift.Result<T, APError>) -> Void) {
        guard let url = URL(string: url) else {
            completed(.failure(.invalidURL))
            return
        }

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in

            if let error =  error {
                print(error)
                completed(.failure(.unableToComplete))
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                
                return
            }

            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(T.self, from: data)
                completed(.success(decodedResponse.self))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
