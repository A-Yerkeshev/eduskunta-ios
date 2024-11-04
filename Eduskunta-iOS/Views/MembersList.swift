//
//  MembersList.swift
//  Eduskunta-iOS
//
//  Created by Arman Yerkeshev on 4.11.2024.
//

import SwiftUI

struct MembersList: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(modelData.members) { member in
                    NavigationLink {
                        MemberDetails(member: member)
                    } label: {
                        MemberRow(member: member)
                    }
                }
            }
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
