//
//  Constants.swift
//  Swift Repositories
//
//  Created by Diego Lima on 12/10/20.
//

import Foundation

enum Constants {
    
    enum Domains {
        static let PROD = "https://api.github.com"
    }
    
    enum Routes {
        static let SearchReposApi = "/search/repositories"
    }
    
    enum Queries {
        static let LanguageSwift = "?q=language:swift"
        static let SortStars = "&sort=stars"
        static let LimitReposByPage = "&per_page=10"
        static let Page = "&page="
    }
    
    static let EndpointSearchRepos = Domains.PROD + Routes.SearchReposApi
    static let EndpointSearchSwiftRepos = EndpointSearchRepos + Queries.LanguageSwift + Queries.SortStars + Queries.LimitReposByPage
}
