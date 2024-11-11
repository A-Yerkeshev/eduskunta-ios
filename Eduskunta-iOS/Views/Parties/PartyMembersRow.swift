//
//  PartyMembersRow.swift
//  Eduskunta-iOS
//
//  Created by Arman Yerkeshev on 11.11.2024.
//

import SwiftUI

struct PartyMembersRow: View {
    @Environment(ModelData.self) var modelData
    var party: String
    var members: [Member]
    
    var body: some View {
        @Bindable var modelData = modelData
        
        VStack(alignment: .leading) {
            HStack {
                Text(partyNames[party] ?? party)
                    .font(.title2)
                FavouriteButton(isSet: .constant(false),
                                favouriteParties: $modelData.favouriteParties,
                                party: party)
            }
                
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(members) { member in
                        NavigationLink {
                            MemberDetails(member: member)
                        } label: {
                            PartyMember(member: member)
                        }
                    }
                }
            }
            .frame(height: 240)
        }
    }
}

#Preview {
    let members = ModelData().members
    PartyMembersRow(
        party: members[0].party,
        members: members
    ).environment(ModelData())
}
