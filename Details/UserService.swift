//
//  UserService.swift
//  Details
//
//  Created by Vivek Guntuku on 12/11/26.
//

import Foundation

enum NetworkError: Error {
    case invalidUrl
    case invalidResponse
}

protocol UserServiceProtocol {
    func fetchUsers() async throws -> [User]
}

final class UserService: UserServiceProtocol {

    private let urlString = "https://jsonplaceholder.typicode.com/users"

    func fetchUsers() async throws -> [User] {
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidUrl
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidResponse
        }

        return try JSONDecoder().decode([User].self, from: data)
    }
}
