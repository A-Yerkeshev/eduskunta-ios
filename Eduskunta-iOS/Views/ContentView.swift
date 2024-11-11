//
//  ContentView.swift
//  Eduskunta-iOS
//
//  Created by Arman Yerkeshev on 4.11.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var viewType: Tab = .byMember
    
    enum Tab {
        case byParty
        case byMember
    }
    
    var body: some View {
        TabView(selection: $viewType) {
            MembersList()
                .tabItem {
                    Label("By Member", systemImage: "list.bullet")
                }
                .tag(Tab.byMember)
            
            PartiesHome()
                .tabItem {
                    Label("By Party", systemImage: "grid")
                }
                .tag(Tab.byParty)
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
