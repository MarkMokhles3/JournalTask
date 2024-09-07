//
//  ArticleCell.swift
//  JournalTask
//
//  Created by MarkFathy on 06/09/2024.
//

import SwiftUI

struct ArticleRow: View {
    var article: Article
    
    var body: some View {
        HStack {
            // Placeholder for article image
            
            if  article.media?.count != 0 {
                AsyncImage(url: URL(string: article.media?[0].mediaMetadata?[2].url ?? "")) { image in
                    image.resizable()
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle()) // This makes the image circular
                } placeholder: {
                    ProgressView()
                }
                .padding(.trailing, 8)
                
            } else {
                Circle()
                    .fill(Color.gray)
                    .frame(width: 40, height: 40)
                    .padding(.trailing, 8)
            }
            
            VStack(alignment: .leading, spacing: 3.0) {
                // Title
                Text(article.title ?? "")
                    .font(.system(size: 16, weight: .semibold))
                    .lineLimit(2)
                
                // Authors
                Text(article.byline ?? "")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.gray)
                
                // Date and Calendar Icon
                HStack(spacing: 4) {
                    Image(systemName: "calendar")
                        .resizable()
                        .frame(width: 12, height: 12)
                        .foregroundColor(.gray)
                    Text(article.publishedDate ?? "")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.gray)
                }
            }
            Spacer()
        }
        .padding(.vertical, 8)
    }
}
