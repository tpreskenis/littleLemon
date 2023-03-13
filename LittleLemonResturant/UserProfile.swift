//
//  UserProfile.swift
//  LittleLemonResturant
//
//  Created by Tim Preskenis on 3/7/23.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.dismiss) private var dismiss
    
    @Binding var rootIsActive: Bool
    
    @State var firstName = UserDefaults.standard.string(forKey: kFirstName)
    @State var lastName = UserDefaults.standard.string(forKey: kLastName)
    @State var email = UserDefaults.standard.string(forKey: kEmail)
    
    @State var changedFirstName = ""
    @State var changedLastName = ""
    @State var changedEmail = ""

    @State var testing = "AppleSause"
    @Environment(\.presentationMode) var presentation
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Text("Personal Information").padding(.top).font(.title3).fontWeight(.bold)
                HStack{
                    VStack(alignment: .leading){
                        Text("Avatar").foregroundColor(.gray)
                        Image("profile-image-placeholder") .resizable () .aspectRatio (contentMode: .fill) .frame (width: 150, height: 150, alignment: .top) .cornerRadius (100)
                    }
                    Button(action: {
                        // What to perform
                    }) {
                        Text("Change")
                            .padding()
                            .background(Color(red: 237/255, green: 239/255, blue: 238/255))
                            .foregroundColor(.gray)
                            .font(.subheadline)
                            .cornerRadius(20)
                    }
                    Button(action: {
                        // What to perform
                    }) {
                        Text("Remove")
                            .padding()
                            .background(Color(red: 237/255, green: 239/255, blue: 238/255))
                            .foregroundColor(.gray)
                            .font(.subheadline)
                            .cornerRadius(20)
                    }
                    Spacer()
                }
                VStack(alignment: .leading){
                    Text("First Name").foregroundColor(.gray)
                    TextField("First Name", text: $changedFirstName)
                        .textFieldStyle(.roundedBorder)
                }.padding(.top)
                VStack(alignment: .leading){
                    Text("Last Name").foregroundColor(.gray)
                    TextField("Last Name", text: $changedLastName)
                        .textFieldStyle(.roundedBorder)
                }.padding(.top)
                VStack(alignment: .leading){
                    Text("Email").foregroundColor(.gray)
                    TextField("Last Name", text: $changedEmail)
                        .textFieldStyle(.roundedBorder)
                }.padding(.top)
                HStack{
                    Spacer()
                    Button(action: {
                        UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                        rootIsActive = true
                        self.presentation.wrappedValue.dismiss()
                    }) {
                        Text("Logout")
                            .padding()
                            .fontWeight(.bold)
                            .background(Color(red: 244/255, green: 206/255, blue: 20/255))
                            .foregroundColor(.black)
                            .font(.subheadline)
                            .cornerRadius(20)
                        
                    }
                    Spacer()
                }.padding(.top)
                 
                HStack{
                    Spacer()
                    Button(action: {
                        changedLastName = lastName ?? ""
                        changedFirstName = firstName ?? ""
                        changedEmail = email ?? ""
                    }) {
                        Text("Discard Changes")
                            .padding()
                            .background(.white)
                            .foregroundColor(.gray)
                            .fontWeight(.bold)
                            .font(.subheadline)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color(red: 237/255, green: 239/255, blue: 238/255), lineWidth: 3))
                    }
                    Button(action: {
                        UserDefaults.standard.set(changedEmail, forKey: kEmail)
                        UserDefaults.standard.set(changedLastName, forKey: kLastName)
                        UserDefaults.standard.set(changedFirstName, forKey: kFirstName)
                    }) {
                        Text("Save Changes")
                            .padding()
                            .background(Color(red: 73/255, green: 94/255, blue: 87/255))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.subheadline)
                            .cornerRadius(20)
                    }
                    Spacer()
                }.padding()
                Spacer()
            }.padding([.leading,.trailing]).overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(red: 237/255, green: 239/255, blue: 238/255), lineWidth: 1)
            )
        }.padding(.top).onAppear(){
            changedLastName = lastName ?? ""
            changedFirstName = firstName ?? ""
            changedEmail = email ?? ""
        }.navigationBarBackButtonHidden(true)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "arrow.left")
                                .padding()
                                .background(Color(red: 73/255, green: 94/255, blue: 87/255))
                                .clipShape(Circle())
                                .foregroundColor(.white)
                                .frame (width: 40, height: 40)
                        }
                    }
                }
                ToolbarItem(placement: .principal) {
                    Image("LittleLemonLogo").resizable () .aspectRatio (contentMode: .fit).frame(width: 150)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image("profile-image-placeholder") .resizable () .aspectRatio (contentMode: .fill) .frame (width: 50, height: 50, alignment: .top) .cornerRadius (100)
                }
                
            }
    }
}
/*
 struct UserProfile_Previews: PreviewProvider {
 static var previews: some View {
 
 UserProfile(rootIsActive: $testingFalse)
 }
 }
 */
