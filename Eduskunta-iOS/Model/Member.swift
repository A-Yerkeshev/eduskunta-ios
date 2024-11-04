//
//  Member.swift
//  Eduskunta-iOS
//
//  Created by Arman Yerkeshev on 4.11.2024.
//

import Foundation
import SwiftUI

struct Member: Hashable, Codable, Identifiable {
    let personNumber: Int
    var seatNumber: Int
    var first: String
    var last: String
    var party: String
    var minister: Bool = false
    let bornYear: Int?
    var constituency: String?
    private var picture: String?
    var twitter: String?
    
    var id: Int { personNumber }
    var image: Image {
        Image(picture ?? "profile-placeholder")
    }
    var partyImg: Image {
        Image(party)
    }
    var isFavourite: Bool? = false
}
