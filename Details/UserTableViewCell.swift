//
//  UserTableViewCell.swift
//  Details
//
//  Created by Vivek Guntuku on 12/11/26.
//

import UIKit

final class UserTableViewCell: UITableViewCell {

    static let reuseId = "UserCell"

    private let nameLabel = UILabel()
    private let emailLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpViews() {
        nameLabel.font = .boldSystemFont(ofSize: 17)
        emailLabel.font = .systemFont(ofSize: 14)
        emailLabel.textColor = .gray

        let stack = UIStackView(arrangedSubviews: [nameLabel, emailLabel])
        stack.axis = .vertical
        stack.spacing = 4
        stack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
    }

    func configure(with user: User) {
        nameLabel.text = user.name
        emailLabel.text = user.email
    }
}
