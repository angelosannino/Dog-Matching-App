//
//  Dog.swift
//  Dog Matching App
//
//  Created by Angelo Sannino on 25/05/21.
//

import SwiftUI
import SwiftyJSON

class Dog: Codable, Identifiable {
    
    var id: UUID = UUID()
    var url: String
    var favourite = false
    
    init(id: UUID = UUID(), url: String) {
        self.id = id
        self.url = url
    }
    
    init?(_ json: [String: JSON]) {
        guard let url = json["message"]?.string else { return nil }
        self.url = url
    }
    
}
