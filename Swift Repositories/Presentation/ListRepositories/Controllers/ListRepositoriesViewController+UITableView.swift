//
//  ListRepositoriesViewController+UITableView.swift
//  Swift Repositories
//
//  Created by Diego Lima on 12/10/20.
//

import Foundation
import UIKit

extension ListRepositoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Table View Data Source methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (listRepositoriesViewModel != nil) ? listRepositoriesViewModel.numberOfRows : 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryTableViewCell.identifier, for: indexPath) as? RepositoryTableViewCell else {
            fatalError("UITableViewCell must be downcasted to RepositoryTableViewCell")
        }
        return cell
    }
    
    // MARK: - Table View Delegate methods
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let rowTableCell = cell as? RepositoryTableViewCell else { return }
        let repositoryVM = listRepositoriesViewModel.getListRepositoriesViewModel(at: indexPath.row)
        rowTableCell.setRepositoryInfo(name: repositoryVM.name, authorName: repositoryVM.owner.author, starsCount: repositoryVM.stars, urlImage: repositoryVM.owner.imageAuthor)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let isReachingEnd = scrollView.contentOffset.y >= 0
            && scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)
        if (isReachingEnd) {
            loadMoreRepositoriesData()
        }
    }
    
    func loadMoreRepositoriesData() {
        page += 1
        listRepositoriesViewModel.callApiToGetSwiftReposData(page: page)
    }
}
