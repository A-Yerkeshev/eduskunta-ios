//
//  FavouriteButton.swift
//  Eduskunta-iOS
//
//  Created by Arman Yerkeshev on 4.11.2024.
//

import SwiftUI


struct FavouriteButton: View {
    @Binding var isSet: Bool?
    
    var body: some View {
        Button {
            if isSet == true {
                isSet = false
            } else {
                isSet = true
            }
        } label: {
           Label("Toggle Favorite", systemImage: isSet == true ? "star.fill" : "star")
               .labelStyle(.iconOnly)
               .foregroundStyle(isSet == true ? .yellow : .gray)
        }
    }
}

#Preview {
    FavouriteButton(isSet: .constant(true))
}
