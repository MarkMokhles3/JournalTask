//
//  ArticleDetailView.swift
//  JournalTask
//
//  Created by MarkFathy on 03/09/2024.
//

import SwiftUI

struct ArticleDetailView: View {
    var article: Article
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                // Title
                Text(article.title ?? "")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                
                // Author and Date Section
                HStack {
                    Text(article.byline ?? "")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    // Date and Icon
                    HStack(spacing: 4) {
                        Image(systemName: "calendar")
                            .resizable()
                            .frame(width: 14, height: 14)
                            .foregroundColor(.gray)
                        Text(article.publishedDate ?? "")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.vertical, 10)
                
                // Separator
                Divider()
                
                // Article Content (Placeholder for now)
                Text(article.abstract ?? "")
                    .font(.body)
                    .foregroundColor(.primary)
                
                Spacer()
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(.systemGray6))
                    .shadow(radius: 5)
            )
            .padding([.horizontal, .bottom], 16)
            
            Spacer()
            Link("Read Full Article", destination: URL(string: article.url ?? "")!)
                .padding()
        }
        .navigationTitle("Article Details")
        
    }
}

