//
//  MembersList.swift
//  Eduskunta-iOS
//
//  Created by Arman Yerkeshev on 4.11.2024.
//

import SwiftUI

struct MembersList: View {
    @Environment(ModelData.self) var modelData
    @State private var favouritesOnly = false
    
    private var filteredMembers: [Member] {
        modelData.members.filter { member in
            (!favouritesOnly || member.isFavourite == true)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $favouritesOnly) {
                    Text("Favourites only")
                }
                
                ForEach(filteredMembers) { member in
                    NavigationLink {
                        MemberDetails(member: member)
                    } label: {
                        MemberRow(member: member)
                    }
                }
            }
            .animation(.default, value: filteredMembers)
            .navigationTitle("Members")
        } detail: {
            Text("Select parliament's member")
        }
    }
}

#Preview {
    MembersList()
        .environment(ModelData())
}
