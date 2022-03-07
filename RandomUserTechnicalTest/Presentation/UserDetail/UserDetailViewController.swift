//
//  UserDetailViewController.swift
//  RandomUserTechnicalTest
//
//  Created by Kévin Esprit on 07/03/2022.
//

import Kingfisher
import UIKit

final class UserDetailViewController: UITableViewController {
    
    private let informationCellIdentifier = "informationCellIdentifier"
    private let viewModel: UserDetailViewModel
    
    lazy var imageView: UIImageView =  {
        let imageView = UIImageView(frame: .init(x: 0, y: 0, width: 150, height: 150))
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 60
        
        return imageView
    }()
    
    init(viewModel: UserDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        UserDetailViewModel.Section.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = UserDetailViewModel.Section(rawValue: indexPath.section) else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: informationCellIdentifier, for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.textProperties.font = .preferredFont(forTextStyle: .caption2)
        content.secondaryTextProperties.font = .preferredFont(forTextStyle: .body)
        content.text = viewModel.text(for: section)
        content.secondaryText = viewModel.value(for: section)
        content.image = UIImage(systemName: viewModel.picto(for: section))
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // MARK: private functions
    private func setup() {
        title = viewModel.title
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: informationCellIdentifier)
        tableView.separatorColor = .clear
        tableView.tableHeaderView = imageView
        imageView.kf.setImage(with: viewModel.imageUrl)
        view.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}
