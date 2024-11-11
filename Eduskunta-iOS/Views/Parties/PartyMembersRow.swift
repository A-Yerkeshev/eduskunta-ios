//
//  PartyMembersRow.swift
//  Eduskunta-iOS
//
//  Created by Arman Yerkeshev on 11.11.2024.
//

import SwiftUI

struct PartyMembersRow: View {
    var party: String
    var members: [Member]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(partyNames[party] ?? party)
                .font(.title2)
                
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
    )
}
