//
//  UsersListViewController.swift
//  RandomUserTechnicalTest
//
//  Created by Kévin Esprit on 07/03/2022.
//

import UIKit

final class UsersListViewController: UITableViewController {
    
    private let viewModel: UsersViewModel
    
    init(viewModel: UsersViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}
