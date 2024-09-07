//
//  ArticleViewModel.swift
//  JournalTask
//
//  Created by MarkFathy on 06/09/2024.
//

import SwiftUI
import Combine

class ArticleViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    @Published var alertItem: AlertItem?
    @Published var searchText = ""
    @Published var resultsWithoutFilteration = [Article]()
    
    
    private var service = APIService()
    private var cancellables = Set<AnyCancellable>()
    
    func getNews() {
        
        isLoading = true
        APIService.shared.getArticles() { [self] result in
            DispatchQueue.main.async { [self] in
                self.isLoading = false
                switch result {
                case .success(let articles):
                    
                    self.articles = articles.results ?? []
                    self.resultsWithoutFilteration = articles.results ?? []
                    
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    switch error {
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                        
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                        
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
    
    func searchFor(query: String) {
        if !query.isEmpty {
            articles = resultsWithoutFilteration.filter { $0.title?.contains(searchText) ?? false
            }
        } else {
            articles = resultsWithoutFilteration
        }
    }
}
