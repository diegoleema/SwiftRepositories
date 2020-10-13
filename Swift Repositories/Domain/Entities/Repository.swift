//
//  RepositoryModel.swift
//  Swift Repositories
//
//  Created by Diego Lima on 12/10/20.
//

import Foundation

struct Repository: Decodable {
    var items: [RepositoryData]
    let totalCount: Int
    let incompleteResults: Bool
    
    enum CodingKeys: String, CodingKey {
        case items
        case totalCount = "total_count"
        case incompleteResults =  "incomplete_results"
    }
}

struct RepositoryData: Decodable {
    let name: String
    let stars: Int
    let owner: OwnerRepository
    
    enum CodingKeys: String, CodingKey {
        case name
        case stars = "stargazers_count"
        case owner
    }
}

struct OwnerRepository: Decodable {
    let author, imageAuthor: String
    
    enum CodingKeys: String, CodingKey {
        case author = "login"
        case imageAuthor = "avatar_url"
    }
}
