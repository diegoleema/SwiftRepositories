//
//  ViewController.swift
//  Swift Repositories
//
//  Created by Diego Lima on 12/10/20.
//

import UIKit

class ListRepositoriesViewController: UIViewController {
    var listRepositoriesViewModel: ListRepositoriesViewModel!
    var page: Int = 1
   
    override func loadView() {
        view = ListRepositoriesView()
        (view as! ListRepositoriesView).setTableViewDataSourceDelegate(dataSourceDelegate: self)
        (view as! ListRepositoriesView).setRefreshControl(target: self, selector: #selector(self.reloadDataBinding(_:)))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
    }
    
    func initViewModel() {
        listRepositoriesViewModel = ListRepositoriesViewModel()
        listRepositoriesViewModel.reloadTableViewClosure = {
            DispatchQueue.main.async { [weak self] in
                (self?.view as! ListRepositoriesView).sectionTableView.reloadData()
            }
        }
        
        listRepositoriesViewModel.updateLoadingStatus = { [weak self] () in
            DispatchQueue.main.async {
                let isLoading = self?.listRepositoriesViewModel.isLoading ?? false
                if isLoading {
                    UIView.animate(withDuration: 0.2, animations: {
                        (self?.view as! ListRepositoriesView).sectionTableView.alpha = 0.0
                    })
                }else {
                    UIView.animate(withDuration: 0.2, animations: {
                        (self?.view as! ListRepositoriesView).sectionTableView.alpha = 1.0
                    })
                }
            }
        }
        
        listRepositoriesViewModel.showAlertClosure = { [weak self] in
            DispatchQueue.main.async {
                if let message = self?.listRepositoriesViewModel.alertMessage {
                    self?.showAlert(message)
                }
            }
        }
    }
    
    @objc func reloadDataBinding(_ sender: AnyObject) {
        page = 1
        listRepositoriesViewModel.callApiToGetSwiftReposData(page: page)
        (view as! ListRepositoriesView).closeRefreshControl()
    }
    
    private func showAlert(_ message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}

