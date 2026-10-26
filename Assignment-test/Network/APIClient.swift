//
//  APIClient.swift
//  Assignment-test
//
//  Created by Swayam on 26/10/26.
//
import Foundation
enum APIErorCases: Error {
    case invalidData
    case invalidURL
    case invalidResponse
}

final class APIClient {
    static func getAPIData<T:Decodable>(url: String) async throws -> T {
        guard let url = URL(string: url) else {
            throw APIErorCases.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse else {
            throw APIErorCases.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            throw APIErorCases.invalidData
        }
    }
}
