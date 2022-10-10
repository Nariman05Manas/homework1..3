//
//  LoginInspektorTests.swift
//  Homework1-3Tests
//
//  Created by qwerty on 08.10.2022.
//

import XCTest
@testable import Homework1_3

class LoginInspectorTests: XCTestCase {
    
    var isLogin: Bool = false

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
        let loginInspector = LoginInspector()
        let expectation = expectation(description: "authorization")
        
        loginInspector.signIn(login: "nariman05@mail.ru", password: "123456") {[weak self] result, message in
            switch result {
            case .success(let resultAuth):
                self?.isLogin = resultAuth
            case .failure(_):
                self?.isLogin = false
            }
            XCTAssertTrue(self!.isLogin)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5)
        
    }
    
    func testExample2() throws {
        
        let loginInspectors = LoginInspector()
        let expectation = expectation(description: "authorization from data base")
        let callback:(User) -> Void = { _ in
            XCTAssertTrue(true)
            expectation.fulfill()
        }
        
        let failureCallback = {
            XCTAssertTrue(false)
            expectation.fulfill()
        }
        
        loginInspectors.checkUserToDataBase(callback: callback, failureCallback: failureCallback)
        
        waitForExpectations(timeout: 5)
        
    }

}
