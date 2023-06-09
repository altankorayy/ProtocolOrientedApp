//
//  UserService.swift
//  ProtocolOrientedUIKit
//
//  Created by Altan on 6.06.2023.
//

import Foundation

protocol UserService {
    func fetchUser(completion: @escaping(Result<User,Error>) -> Void)
}
