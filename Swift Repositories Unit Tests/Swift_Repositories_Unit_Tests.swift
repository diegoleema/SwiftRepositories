//
//  Swift_Repositories_Unit_Tests.swift
//  Swift Repositories Unit Tests
//
//  Created by Diego Lima on 12/10/20.
//

import XCTest
@testable import Swift_Repositories

class Swift_Repositories_Unit_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSuccessCallApiToGetSwiftReposData() throws {
        let apiService = APIService()
        apiService.apiToGetSwiftReposData(page: 1){ (dataRepos) in
            XCTAssertNotNil(dataRepos)
        }
    }
    
    func testErrorCallApiToGetSwiftReposData() throws {
        let apiService = APIService()
        apiService.apiToGetSwiftReposData(page: -1){ (dataRepos) in
            XCTAssertNil(dataRepos)
        }
    }
    
    func testSuccessComparationEndpointUrlSearchRepositories() {
        XCTAssertEqual(Constants.EndpointSearchRepos, Constants.Domains.PROD + Constants.Routes.SearchReposApi)
    }
    
    func testFailComparationEndpointUrlSearchRepositories() {
        XCTAssertNotEqual(Constants.EndpointSearchRepos, Constants.Domains.PROD + Constants.Routes.SearchReposApi + "error_simulated")
    }

}
