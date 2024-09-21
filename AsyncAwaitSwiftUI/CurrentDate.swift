//
//  CurrentDate.swift
//  AsyncAwaitSwiftUI
//
//  Created by Bhushan Borse DXC on 05/06/24.
//

import Foundation

struct CurrentDate: Decodable, Identifiable {
    let id = UUID()
    let date: String
    
    private enum CodingKeys: String, CodingKey {
        case date = "date"
    }
}
