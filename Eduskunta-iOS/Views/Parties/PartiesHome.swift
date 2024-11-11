//
//  PartiesHome.swift
//  Eduskunta-iOS
//
//  Created by Arman Yerkeshev on 11.11.2024.
//

import SwiftUI

struct PartiesHome: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(modelData.parties.keys.sorted(), id: \.self) { party in
                    PartyMembersRow(party: partyNames[party] ?? party, members: modelData.parties[party]!)
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
