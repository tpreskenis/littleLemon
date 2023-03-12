//
//  MenuLayout.swift
//  LittleLemonResturant
//
//  Created by Tim Preskenis on 3/12/23.
//

import SwiftUI

struct MenuLayout: View {
    func test() {
        print("test")
    }
    var body: some View {
        VStack{
            Text("ORDER FOR DELIVERY!")
                .fontWeight(.bold)
            HStack{
                Button("Starters", action: test).padding()
                    .fontWeight(.bold)
                    .font(.subheadline)
                    .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                    .background(Color(red: 237/255, green: 239/255, blue: 238/255))
                    .cornerRadius(20)
                Button("Mains", action: test).padding()
                    .fontWeight(.bold)
                    .font(.subheadline)
                    .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                    .background(Color(red: 237/255, green: 239/255, blue: 238/255))
                    .cornerRadius(20)
                Button("Desserts", action: test).padding()
                    .fontWeight(.bold)
                    .font(.subheadline)
                    .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                    .background(Color(red: 237/255, green: 239/255, blue: 238/255))
                    .cornerRadius(20)
                Button("Drinks", action: test).padding()
                    .fontWeight(.bold)
                    .font(.subheadline)
                    .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                    .background(Color(red: 237/255, green: 239/255, blue: 238/255))
                    .cornerRadius(20)
            }
        }
    }
}

struct MenuLayout_Previews: PreviewProvider {
    static var previews: some View {
        MenuLayout()
    }
}
