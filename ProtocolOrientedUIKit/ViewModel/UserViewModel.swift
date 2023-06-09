//
//  UserViewModel.swift
//  ProtocolOrientedUIKit
//
//  Created by Altan on 6.06.2023.
//

import Foundation

class UserViewModel {
    
    private let userService : UserService
    
    weak var output: UserViewModelOutput? //weak var -> sadece oluşturduğumuz değişkene erişildiğinde initialize edilir.
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func fetchUsers() {
        userService.fetchUser { [weak self] result in
            switch result {
            case .success(let user):
                self?.output?.updateView(name: user.name, email: user.email, username: user.username)
            case .failure(_):
                self?.output?.updateView(name: "No user", email: "...", username: "...")
            }
        }
    }
}
