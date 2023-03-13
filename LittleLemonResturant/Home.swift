//
//  Home.swift
//  LittleLemonResturant
//
//  Created by Tim Preskenis on 3/7/23.
//

import SwiftUI

struct Home: View {
    let persistence = PersistenceController.shared;
    
    var body: some View {
        TabView{
            Menu()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }.environment(\.managedObjectContext, persistence.container.viewContext)
        }.navigationBarBackButtonHidden(true).onAppear(){
            persistence.clear()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
