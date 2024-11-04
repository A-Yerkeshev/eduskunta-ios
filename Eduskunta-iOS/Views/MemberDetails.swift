//
//  MemberDetails.swift
//  Eduskunta-iOS
//
//  Created by Arman Yerkeshev on 4.11.2024.
//

import SwiftUI

struct MemberDetails: View {
    var member: Member
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    MemberDetails(member: ModelData().members[0])
}
