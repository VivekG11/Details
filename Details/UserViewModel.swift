//
//  UserViewModel.swift
//  Details
//
//  Created by Vivek Guntuku on 12/11/26.
//

import Foundation

@MainActor
final class UsersViewModel {

    private let service: UserServiceProtocol
    private(set) var users: [User] = []

    init(service: UserServiceProtocol = UserService()) {
        self.service = service
    }

    var numberOfRows: Int {
        users.count
    }

    func user(at index: Int) -> User {
        users[index]
    }

    func fetchUsers() async throws {
        users = try await service.fetchUsers()
    }
}
