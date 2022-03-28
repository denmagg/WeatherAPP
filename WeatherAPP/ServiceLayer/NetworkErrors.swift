//
//  NetworkErrors.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 18.03.2022.
//

import Foundation

enum NetworkError: Error, Equatable {
    case failedToWriteData
    case serverError
    case noConnection
    case fundamental
    case unexpected(code: Int)
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .failedToWriteData:
            return NSLocalizedString("Failed  to write data into the file", comment: "1")
        case .serverError:
            return NSLocalizedString("Error receiving data from the server. Please wait a few minutes and try again.", comment: "2")
        case .noConnection:
            return NSLocalizedString("No internet connection. Please connect your iPhone to the internet", comment: "3")
        case .fundamental:
            return NSLocalizedString("Fundamental networking error", comment: "4")
        case .unexpected(_):
            return NSLocalizedString("An unexpected error occurred.", comment: "5")
        }
    }
}
