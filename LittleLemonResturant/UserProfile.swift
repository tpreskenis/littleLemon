//
//  UserProfile.swift
//  LittleLemonResturant
//
//  Created by Tim Preskenis on 3/7/23.
//

import SwiftUI

struct UserProfile: View {
    @State var firstName = UserDefaults.standard.string(forKey: kFirstName)
    @State var lastName = UserDefaults.standard.string(forKey: kLastName)
    @State var email = UserDefaults.standard.string(forKey: kEmail)

    @Environment(\.presentationMode) var presentation
    var body: some View {
        VStack{
            Text("Personal Information")
            Image("profile-image-placeholder") .resizable () .aspectRatio (contentMode: .fill) .frame (width: 150, height: 150, alignment: .top) .cornerRadius (100)
            Text(firstName ?? "")
            Text(lastName ?? "")
            Text(email ?? "")
            
            Button("Logout") {
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }
            Button("test") {
                UserDefaults.standard.setValue("Test", forKey: kFirstName)
                UserDefaults.standard.setValue("Test", forKey: kLastName)
                UserDefaults.standard.setValue("Test", forKey: kEmail)
            }
            Spacer()
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
