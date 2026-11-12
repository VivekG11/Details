//
//  ViewController.swift
//  Details
//
//  Created by Vivek Guntuku on 12/11/26.
//

import UIKit

class ViewController: UIViewController {

    private let viewModel = UsersViewModel()

    private let userTableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(UserTableViewCell.self, forCellReuseIdentifier: UserTableViewCell.reuseId)
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(userTableView)
        userTableView.dataSource = self
        userTableView.delegate = self
        setUpConstraints()
        title = "Users"

        loadUsers()
    }

    private func loadUsers() {
        Task {
            do {
                try await viewModel.fetchUsers()
                userTableView.reloadData()          
            } catch {
                print(error.localizedDescription)
            }
        }
    }


    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            userTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            userTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: UserTableViewCell.reuseId,
            for: indexPath
        ) as! UserTableViewCell
        cell.configure(with: viewModel.user(at: indexPath.row))
        return cell
    }

    
}
