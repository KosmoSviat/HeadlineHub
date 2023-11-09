//
//  NewsPageViewModel.swift
//  HeadlineHub
//
//  Created by Sviatoslav Samoilov on 13.08.2023.
//

import Foundation

protocol NewsPageViewModelProtocol {
    var title: String { get }
    var description: String { get }
    var date: String { get }
    var imageData: Data? { get }
}

final class NewsPageViewModel: NewsPageViewModelProtocol {
    let title: String
    let description: String
    let date: String
    let imageData: Data?
    
    init(article: ArticleCellViewModel) {
        title = article.title
        description = article.description
        date = article.date
        imageData = article.imageData
    }
}
