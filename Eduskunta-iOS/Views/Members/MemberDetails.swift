//
//  MemberDetails.swift
//  Eduskunta-iOS
//
//  Created by Arman Yerkeshev on 4.11.2024.
//

import SwiftUI

struct MemberDetails: View {
    @Environment(ModelData.self) var modelData
    var member: Member
    private var index: Int {
        modelData.members.firstIndex(where: { $0.id == member.id })!
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        VStack {
            HStack {
                Text("\(member.first) \(member.last)")
                    .font(.largeTitle)
                FavouriteButton(isSet: $modelData.members[index].isFavourite)
            }
            member.partyImg
                .resizable()
                .scaledToFit()
            Divider()
            HStack {
                VStack(alignment: .leading) {
                    if member.minister {
                        Text("Minister").font(.headline)
                    }
                    HStack {
                        Text("Party:")
                        member.partyImg
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    Text("Seat number: \(member.seatNumber)")
                    if let constituency = member.constituency {
                        Text("Constituency: \(constituency)")
                    }
                    let bornYear = member.bornYear == nil ? "N/A" : "\(member.bornYear!)"
                    Text("Born year: \(bornYear)")
                    if let twitter = member.twitter {
                        Text("[Twitter](\(twitter))")
                    }
                }
            }
        }
    }
}

#Preview {
    MemberDetails(member: ModelData().members[0]).environment(ModelData())
}
