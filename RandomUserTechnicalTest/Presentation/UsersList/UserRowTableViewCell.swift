//
//  UserRowTableViewCell.swift
//  RandomUserTechnicalTest
//
//  Created by Kévin Esprit on 07/03/2022.
//

import UIKit

 final class UserRowTableViewCell: UITableViewCell {

     private let spacing: CGFloat = 10

     private lazy var primaryLabel: UILabel = {
         let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.textColor = .black
         label.font = .preferredFont(forTextStyle: .headline)
         return label
     }()

     private lazy var secondaryLabel: UILabel = {
         let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.textColor = .lightGray
         label.font = .preferredFont(forTextStyle: .subheadline)
         return label
     }()

     private lazy var iconLabel: UILabel = {
         let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.font = .preferredFont(forTextStyle: .largeTitle)
         return label
     }()

     private lazy var verticalStackView: UIStackView = {
         let stackView = UIStackView()
         stackView.axis = .vertical
         stackView.spacing = spacing
         stackView.translatesAutoresizingMaskIntoConstraints = false
         return stackView
     }()

     private lazy var horizontalStackView: UIStackView = {
         let stackView = UIStackView()
         stackView.axis = .horizontal
         stackView.alignment = .leading
         stackView.distribution = .fillProportionally
         stackView.spacing = spacing
         stackView.translatesAutoresizingMaskIntoConstraints = false
         return stackView
     }()

     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         setupUI()
     }

     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }

     private func setupUI() {
         addSubview(horizontalStackView)
         horizontalStackView.topAnchor.constraint(equalTo: topAnchor, constant: spacing).isActive = true
         horizontalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -spacing).isActive = true
         horizontalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: spacing).isActive = true
         horizontalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -spacing).isActive = true
         horizontalStackView.addArrangedSubview(iconLabel)
         horizontalStackView.addArrangedSubview(verticalStackView)
         verticalStackView.addArrangedSubview(primaryLabel)
         verticalStackView.addArrangedSubview(secondaryLabel)
     }

     func set(viewModel: UserViewModel) {
         primaryLabel.text = viewModel.username
         secondaryLabel.text = viewModel.email
         iconLabel.text = viewModel.profile
     }

     override func prepareForReuse() {
         primaryLabel.text = nil
         secondaryLabel.text = nil
         iconLabel.text = nil
     }
 }
