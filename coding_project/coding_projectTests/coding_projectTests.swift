//
//  coding_projectTests.swift
//  coding_projectTests
//
//  Created by abdul karim on 16/04/23.
//

import XCTest
@testable import coding_project

final class coding_projectTests: XCTestCase {
    
    var viewModel: SignUpViewModel?
    var testingUserModel:UserModel?
    
    override func setUp() async throws {
        viewModel = SignUpViewModel()
        testingUserModel = UserModel(fname: "abdul", email: "abdul@dev.com", website: "www.abdul.dev", password: "12345")
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDataPointNotNil() throws {
       XCTAssertNotNil(testingUserModel)
       XCTAssertNotNil(viewModel)
    }
    
    func testEmailValid() throws {
        let email = testingUserModel?.email
        XCTAssertTrue(((viewModel?.isEmailValid(email!)) != nil))
    }

}
