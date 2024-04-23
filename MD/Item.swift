//
//  Item.swift
//  MD
//
//  Created by 문재윤 on 4/10/24.
//

//import Foundation
import SwiftData
import SwiftUI

@Model
class Item {
    @Attribute(.unique) var id = UUID()
    var timestamp: Date
    var title: String
    var content1: String
    var content2: String
    var expenses: Int
    var income: Int
    var lock: Bool
    

    init(id: UUID = UUID(), timestamp: Date, title: String, content1: String, content2: String, expenses: Int, income: Int, lock: Bool) {
        self.id = id
        self.timestamp = timestamp
        self.title = title
        self.content1 = content1
        self.content2 = content2
        self.expenses = expenses
        self.income = income
        self.lock = lock
    }
    
}















    
    
    

