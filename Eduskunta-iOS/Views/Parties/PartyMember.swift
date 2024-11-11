//
//  PartyMember.swift
//  Eduskunta-iOS
//
//  Created by Arman Yerkeshev on 11.11.2024.
//

import SwiftUI

struct PartyMember: View {
    var member: Member
    
    var body: some View {
        VStack {
            Text("\(member.first) \(member.last)")
                .font(.headline)
            member.partyImg
                .renderingMode(.original)
                .resizable()
                .frame(width: 150, height: 210)
        }
        .padding(.leading, 15)
    }
}

#Preview {
    PartyMember(member: ModelData().members[0])
}
