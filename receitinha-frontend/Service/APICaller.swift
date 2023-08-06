//
//  APICaller.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 06/08/23.
//

import Foundation

enum HttpMethod: String {
    case post = "POST"
}

enum APICallerError: Error {
    case errorInCall
}

enum APICallerStatus {
    case completed
}


class APICaller {
    
    
    func createRequest(with url: URL, and method: HttpMethod, body data: Data) -> URLRequest {
        var request = URLRequest(url: url)

        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = data
        
        return request
    }
    
    func peform(_ request: URLRequest ) async -> Result<APICallerStatus, APICallerError> {
        do {
            let (_, _) = try await URLSession.shared.data(for: request)
            return .success(.completed)
        } catch {
            return .failure(APICallerError.errorInCall)
        }
        
    }
}
