//
//  UserViewModelOutput.swift
//  ProtocolOrientedUIKit
//
//  Created by Altan on 6.06.2023.
//

import Foundation

protocol UserViewModelOutput : AnyObject { //weak var oluşturabilmemiz için AnyObject kullanmamız gerekir.
    
    func updateView(name: String, email: String, username: String)
}
