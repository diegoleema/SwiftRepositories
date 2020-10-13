//
//  ListRepositoriesViewModel.swift
//  Swift Repositories
//
//  Created by Diego Lima on 12/10/20.
//

import UIKit

class ListRepositoriesViewModel: NSObject {
    
    //MARK: - Variables accessibles
    var reloadTableViewClosure: (()->())?
    var updateLoadingStatus: (()->())?
    var showAlertClosure: (()->())?
    private var apiService: APIService!
    
    private var dataRepos: Repository! {
        didSet {
            self.setListRepositoriesViewModel()
        }
    }
    
    var repositoryDataViewModels: [RepositoryData]! {
        didSet {
            self.reloadTableViewClosure?()
        }
    }
    
    var numberOfRows: Int {
        return (repositoryDataViewModels != nil) ? repositoryDataViewModels.count : 0
    }
    
    var alertMessage: String? {
        didSet {
            self.showAlertClosure?()
        }
    }
    
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }
    
    //MARK: - Initializer
    override init() {
        super.init()
        self.apiService = APIService()
        callApiToGetSwiftReposData(page: 1)
    }
    
    func getListRepositoriesViewModel(at section: Int) -> RepositoryData {
        return repositoryDataViewModels[section]
    }
    
    //MARK: - Action Methods
    func callApiToGetSwiftReposData(page: Int) {
        self.isLoading = true
        self.apiService.apiToGetSwiftReposData(page: page){ [weak self] (dataRepos) in
            self?.isLoading = false
            if (self?.dataRepos != nil && page != 1) {
                self?.dataRepos.items.append(contentsOf: dataRepos.items)
            } else {
                self?.dataRepos = dataRepos
            }
        }
    }
    
    private func setListRepositoriesViewModel() {
        var tempRepositoryDataViewModels = [RepositoryData]()
        
        dataRepos.items.forEach { item in
            tempRepositoryDataViewModels.append(item)
        }
        self.repositoryDataViewModels = tempRepositoryDataViewModels
    }
    

}
