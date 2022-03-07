//
//  UsersListViewController.swift
//  RandomUserTechnicalTest
//
//  Created by Kévin Esprit on 07/03/2022.
//

import Combine
import UIKit

final class UsersListViewController: UITableViewController {
    
    private let viewModel: UsersViewModel
    private let cellIdentifier = "userCellIdentifier"
    private var cancelable: [AnyCancellable] = []
    private let refreshController: UIRefreshControl = .init()
    
    init(viewModel: UsersViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindingViewModel()
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
    
    // MARK: - ScrollView
     override func scrollViewDidScroll(_ scrollView: UIScrollView) {
         guard scrollView.contentOffset.y > (tableView.contentSize.height-200) - scrollView.frame.size.height else { return }
         viewModel.fetchMoreUsers()
     }
    
    // MARK: private functions
    private func setup() {
        title = "RandomUser"
        tableView.register(UserRowTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        refreshController.addAction(.init(handler: refresh), for: .valueChanged)
        tableView.refreshControl = refreshController
        bindingViewModel()
        viewModel.fetchUsers()
    }
    
    private func bindingViewModel() {
        viewModel.$users
            .receive(on: DispatchQueue.main)
            .sink { _ in
            } receiveValue: {[weak self] users in
                self?.tableView.reloadData()
            }
            .store(in: &cancelable)
        
        viewModel.$isLoading
            .receive(on: DispatchQueue.main)
            .sink { _ in
            } receiveValue: {[weak self] isLoading in
                self?.tableView.tableFooterView = isLoading ? UIActivityIndicatorView(style: .large) : nil
            }
            .store(in: &cancelable)
        
        viewModel.$showError
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                if value {
                    self?.showGenericError()
                }
            }
            .store(in: &cancelable)
    }
    
    // MARK: - GenericError
    private func showGenericError() {
        let alert = UIAlertController(title: viewModel.genericErrorTitle,
                                      message: viewModel.genericErrorMessage,
                                      preferredStyle: .actionSheet)
        alert.addAction(.init(title: viewModel.genericErrorActionTitle,
                              style: .default,
                              handler: retryFetch))
        self.show(alert, sender: self)
    }
    
    private func retryFetch(_ alert: UIAlertAction) {
        viewModel.fetchUsers()
    }
    
    private func refresh(_ action: UIAction) {
        viewModel.fetchUsers()
        refreshController.endRefreshing()
    }
}
