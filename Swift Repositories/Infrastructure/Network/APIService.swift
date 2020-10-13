//
//  APIService.swift
//  Swift Repositories
//
//  Created by Diego Lima on 12/10/20.
//

import UIKit

class APIService: NSObject {
    private let sourcesURL = Constants.EndpointSearchSwiftRepos
    
    func apiToGetSwiftReposData(page: Int, completion : @escaping (Repository) -> ()){
        URLSession.shared.dataTask(with: URL(string: sourcesURL + Constants.Queries.Page + "\(page)")!) { (data, urlResponse, error) in
            if let dataResponse = data {
                let jsonDecoder = JSONDecoder()
                let dataRepos = try! jsonDecoder.decode(Repository.self, from: dataResponse)
                    completion(dataRepos)
            }
        }.resume()
    }
}
