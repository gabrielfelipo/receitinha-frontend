//
//  APICaller.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 06/08/23.
//

import Foundation

enum HttpMethod: String {
    case post = "POST"
    case get = "GET"
}

enum APICallerError: Error {
    case errorInCall
}

enum APICallerStatus {
    case completed
}


class APICaller {
    
    private var token: String {
        return UserDefaults.standard.string(forKey: "token") ?? ""
    }
    
    func createRequest(with url: URL, and method: HttpMethod, body data: Data? = nil) -> URLRequest {
        var request = URLRequest(url: url)

        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = data
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
    
        return request
    }
    
    func peform<T: Codable>(_ request: URLRequest, expecting: T.Type) async -> Result<T, APICallerError> {
        do {
            let (data , response) = try await URLSession.shared.data(for: request)
            
            guard let status = response.getStatusCode() else { return .failure(.errorInCall) }
            let serverError = (300..<600).contains(status)
            if(serverError) { return .failure(.errorInCall) }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
    
            let dataDecoded = try decoder.decode(expecting, from: data)
            return .success(dataDecoded)
        } catch {
            print(error)
            return .failure(APICallerError.errorInCall)
        }
        
    }
}

extension URLResponse {

    func getStatusCode() -> Int? {
        if let httpResponse = self as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        return nil
    }
}
