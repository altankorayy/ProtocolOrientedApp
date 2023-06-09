//
//  APIManager.swift
//  ProtocolOrientedUIKit
//
//  Created by Altan on 6.06.2023.
//

import Foundation

class APIManager : UserService {
     
    /*
    static let shared = APIManager()
    private init() {} //Private init yaptığımız için let apiManager = APIManager() yapamayız fakat APIManager.shared yapabiliriz.
    */
    
    func fetchUser(completion: @escaping(Result<User,Error>) -> Void) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            
            DispatchQueue.main.async {
                if let user = try? JSONDecoder().decode([User].self, from: data).last {
                    completion(.success(user))
                } else {
                    completion(.failure(NSError()))
                }
            }
            
        }.resume()
        
    }
}

