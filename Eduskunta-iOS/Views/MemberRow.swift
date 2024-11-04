//
//  MemberRow.swift
//  Eduskunta-iOS
//
//  Created by Arman Yerkeshev on 4.11.2024.
//

import SwiftUI

struct MemberRow: View {
    var member: Member
    
    var body: some View {
        HStack {
            if member.isFavourite == true {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
            Text(member.first + " " + member.last)
                .font(.headline)
            Spacer()
            member.partyImg
                .resizable()
                .frame(width: 50, height: 50)
        }
        Divider()
    }
}

#Preview {
    let members = ModelData().members
    return Group {
        MemberRow(member: members[0])
        MemberRow(member: members[1])
    }
}
