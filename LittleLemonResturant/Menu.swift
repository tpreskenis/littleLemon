//
//  Menu.swift
//  LittleLemonResturant
//
//  Created by Tim Preskenis on 3/7/23.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack{
            Text("Title")
            Text("Location")
            Text("This is a short description of the whole application below the two previous fields")
            List{
                
            }
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
