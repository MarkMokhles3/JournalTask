//
//  ArticleListView.swift
//  JournalTask
//
//  Created by MarkFathy on 03/09/2024.
//

import SwiftUI

struct ArticleListView: View {
    
    @StateObject private var viewModel = ArticleViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                
                // Article List
                List(viewModel.articles) { article in
                    NavigationLink(destination: ArticleDetailView(article: article)) {
                        ArticleRow(article: article)
                    }
                }
                //                .listStyle(PlainListStyle())
                .navigationTitle("NY Times Articles")
                
                // Searchable
                .searchable(text: $viewModel.searchText, prompt: "searchForArticle")
                .onChange(of: viewModel.searchText) { searchText in
                    viewModel.searchFor(query: searchText)
                }
            } .onAppear {
                viewModel.getNews()
            }
            .refreshable { // Pull to refresh
                viewModel.getNews()
            }
        }
    }
}



