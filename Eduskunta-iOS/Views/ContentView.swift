//
//  ContentView.swift
//  Eduskunta-iOS
//
//  Created by Arman Yerkeshev on 4.11.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MembersList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
