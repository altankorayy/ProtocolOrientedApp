//
//  ProtocolOrientedUIKitTests.swift
//  ProtocolOrientedUIKitTests
//
//  Created by Altan on 5.06.2023.
//

import XCTest
@testable import ProtocolOrientedUIKit

final class ProtocolOrientedUIKitTests: XCTestCase {
    
    private var userViewModel : UserViewModel!
    private var userService : MockUserService!
    private var output : MockUserViewModelOutput!

    override func setUpWithError() throws {
        userService = MockUserService()
        userViewModel = UserViewModel(userService: userService)
        output = MockUserViewModelOutput()
        userViewModel.output = output
    }

    override func tearDownWithError() throws {
        userService = nil
        userViewModel = nil
    }

    func testUpdateView_whenAPISuccess_showsEmailNameUserName() throws {
        let mockUser = User(id: 1, name: "Altan Koray", username: "altankoray", email: "altankoraybenli@gmail.com", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "", website: "", company: Company(name: "", catchPhrase: "", bs: ""))
        
        userService.fetchUserMockResult = .success(mockUser)
        
        userViewModel.fetchUsers()
        
        XCTAssertEqual(output.updateViewArray.first?.username, "altankoray")
    }
    
    func testUpdateView_whenAPIFailure_showsNoUser() throws {
        userService.fetchUserMockResult = .failure(NSError())
        userViewModel.fetchUsers()
        XCTAssertEqual(output.updateViewArray.first?.name, "No user")
    }

}

//Mock -> (Taklit) Testte internete istek atmayacağız onun yerine atılmış gibi yapacağız o yüzden bu classı yazıyoruz.
class MockUserService : UserService {
    
    var fetchUserMockResult : Result<ProtocolOrientedUIKit.User, Error>?
    
    func fetchUser(completion: @escaping (Result<ProtocolOrientedUIKit.User, Error>) -> Void) {
        if let result = fetchUserMockResult {
            completion(result)
        }
    }
}

class MockUserViewModelOutput : UserViewModelOutput {
    
    var updateViewArray : [(name: String, email: String, username: String)] = []
    
    func updateView(name: String, email: String, username: String) {
        updateViewArray.append((name,email,username))
    }
    
    
}
