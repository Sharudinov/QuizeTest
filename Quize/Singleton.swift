//
//  Singleton.swift
//  Quize
//
//  Created by Мурад on 23.09.2021.
//

import Foundation
class Singleton {
    
    static let shared = Singleton()
    
    var userName: String = ""
    
    private init () {}
}
