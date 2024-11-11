//
//  PartiesHome.swift
//  Eduskunta-iOS
//
//  Created by Arman Yerkeshev on 11.11.2024.
//

import SwiftUI

struct PartiesHome: View {
    @Environment(ModelData.self) var modelData
    @State private var favouritesOnly = false
    
    private var filteredParties: [String] {
        modelData.parties.keys.filter {
            !favouritesOnly || modelData.favouriteParties.contains($0)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $favouritesOnly) {
                    Text("Favourites only")
                }
                
                ForEach(filteredParties.sorted(), id: \.self) { party in
                    PartyMembersRow(party: party, members: modelData.parties[party]!)
                }
            }
        } detail: {
            Text("Parties:")
        }
    }
}

#Preview {
    PartiesHome()
        .environment(ModelData())
}
