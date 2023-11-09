//
//  TableCollectionViewSection.swift
//  HeadlineHub
//
//  Created by Sviatoslav Samoilov on 16.08.2023.
//

import Foundation

protocol TableCollectionViewItemsProtocol { }

struct TableCollectionViewSection {
    var title: String?
    var items: [TableCollectionViewItemsProtocol]
}
