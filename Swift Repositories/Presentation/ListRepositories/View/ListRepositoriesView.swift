//
//  ListRepositoriesView.swift
//  Swift Repositories
//
//  Created by Diego Lima on 12/10/20.
//

import UIKit
/**
 ListRepositoriesView class with contain screen layout and contraints of First Screen
 
 - Returns: ListRepositoriesView UIView
 */
class ListRepositoriesView: UIView {
    
    //MARK: - Elements and Properties
    var topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        return view
    }()
    
    var topLabel: UILabel = {
        let label = UILabel()
        label.text = "Swift Repositories"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    var sectionTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RepositoryTableViewCell.self, forCellReuseIdentifier: RepositoryTableViewCell.identifier)
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        tableView.allowsSelection = false
        return tableView
    }()
    
    var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        return refreshControl
    }()
    
    //MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubviews()
    }
    
    func createSubviews() {
        backgroundColor = .white
        setTopView()
        setTopLabel()
        setTableView()
    }
    
    //MARK: - Constraints
    private func setTopView() {
        addSubview(topView)
        topView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15).isActive = true
    }
    
    private func setTopLabel() {
        topView.addSubview(topLabel)
        topLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 16).isActive = true
        topLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
    }
    
    private func setTableView() {
        addSubview(sectionTableView)
        sectionTableView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        sectionTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        sectionTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        sectionTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    //MARK: - Update TableView
    func setTableViewDataSourceDelegate <obj: UITableViewDataSource & UITableViewDelegate> (
        dataSourceDelegate: obj) {
        sectionTableView.dataSource = dataSourceDelegate
        sectionTableView.delegate = dataSourceDelegate
        sectionTableView.reloadData()
    }
    
    //MARK: - Refresh Control Target
    func setRefreshControl(target: AnyObject, selector: Selector) {
        refreshControl.addTarget(target, action: selector, for: .valueChanged)
        sectionTableView.addSubview(refreshControl)
    }
    
    func closeRefreshControl() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.refreshControl.endRefreshing()
        }
    }
}
