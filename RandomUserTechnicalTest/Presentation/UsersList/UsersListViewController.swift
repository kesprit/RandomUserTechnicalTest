//
//  UsersListViewController.swift
//  RandomUserTechnicalTest
//
//  Created by Kévin Esprit on 07/03/2022.
//

import UIKit

final class UsersListViewController: UITableViewController {
    
    private let viewModel: UsersViewModel
    private let cellIdentifier = "userCellIdentifier"
    
    init(viewModel: UsersViewModel) {
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
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! UserRowTableViewCell
        cell.set(viewModel: viewModel.users[indexPath.row])
        return cell
    }
    
    
    // MARK: private functions
    private func setup() {
        title = "RandomUser"
        tableView.register(UserRowTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
}
