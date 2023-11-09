//
//  NetworkingError.swift
//  HeadlineHub
//
//  Created by Sviatoslav Samoilov on 11.08.2023.
//

import Foundation

enum NetworkingError: Error {
case networkingError(_ error: Error)
    case unknown
}
