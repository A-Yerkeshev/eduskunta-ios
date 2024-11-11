//
//  FavouriteButton.swift
//  Eduskunta-iOS
//
//  Created by Arman Yerkeshev on 4.11.2024.
//

import SwiftUI


struct FavouriteButton: View {
    @Binding var isSet: Bool?
    @Binding var favouriteParties: [String]
    var party: String? = nil
    
    private var mode: Mode {
        if party != nil {
            .party
        } else {
            .member
        }
    }
    
    private enum Mode {
        case member
        case party
    }
    
    var body: some View {
        Button {
            switch mode {
                case .member:
                    if isSet == true {
                        isSet = false
                    } else {
                        isSet = true
                    }
                case .party:
                    if let idx = favouriteParties.firstIndex(of: party!) {
                        favouriteParties.remove(at: idx)
                    } else {
                        favouriteParties.append(party!)
                    }
            }
            
        } label: {
            var icon: String
            var color: Color
            
            switch mode {
                case .member:
                    if isSet == true {
                        icon = "star.fill"
                        color = .yellow
                    } else {
                        icon = "star"
                        color = .gray
                    }
                case .party:
                    if favouriteParties.contains(party!) {
                        icon = "star.fill"
                        color = .yellow
                    } else {
                        icon = "star"
                        color = .gray
                    }
            }
            return Label("Toggle Favorite", systemImage: icon)
               .labelStyle(.iconOnly)
               .foregroundStyle(color)
        }
    }
}

#Preview {
    FavouriteButton(
        isSet: .constant(true),
        favouriteParties: .constant(["sdp", "kd"]),
        party: "kesk"
    )
}
