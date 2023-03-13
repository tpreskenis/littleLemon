//
//  Onboarding.swift
//  LittleLemonResturant
//
//  Created by Tim Preskenis on 3/7/23.
//

import SwiftUI

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"
let kIsLoggedIn = "kIsLoggedIn"

struct Onboarding: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var isLoggedIn = false
    @State var firstNameTrigger = false
    @State var lastNameTrigger = false
    @State var emailTrigger = false
    
    var body: some View {
        NavigationView {
            VStack{
                NavigationLink(destination: Home(), isActive: $isLoggedIn){
                    EmptyView()
                }
                VStack{
                    Text("Welcome To")
                        .font(Font.custom("American Typewriter", size: 16.0))
                        .foregroundColor(Color(red: 244/255, green: 206/255, blue: 20/255))
                        .fontWeight(.semibold)
                    Text("Little Lemon")
                        .font(Font.custom("American Typewriter", size: 32.0))
                        .foregroundColor(Color(red: 244/255, green: 206/255, blue: 20/255))
                        .fontWeight(.semibold)
                    Text("Chicago")
                        .font(Font.custom("American Typewriter", size: 24.0))
                        .foregroundColor(Color(red: 237/255, green: 239/255, blue: 238/255)).padding([.top], 6)
                    HStack{
                        Image("Pasta").resizable ().scaledToFill() .frame (width: 140, height: 80, alignment: .center) .cornerRadius (20)
                        Image("Grilled fish").resizable ().scaledToFill() .frame (width: 140, height: 80, alignment: .center) .cornerRadius (20)
                        Image("Lemon dessert").resizable ().scaledToFill() .frame (width: 140, height: 80, alignment: .center) .cornerRadius (20)
                    }.background(Color(red: 73/255, green: 94/255, blue: 87/255)).padding()

                }.background(Color(red: 73/255, green: 94/255, blue: 87/255))
                VStack{
                    Text("Register").font(.title)
                        .foregroundColor(Color.black)
                        .fontWeight(.semibold)
                        .padding()
                    if(!firstNameTrigger) {
                        VStack{
                            HStack {
                                Spacer(minLength: 20)
                                HStack (alignment: .center,
                                        spacing: 10) {
                                    Image(systemName: "person.fill")
                                        .resizable()
                                        .frame(width: 15, height: 15, alignment: .center)
                                        .foregroundColor(.gray)
                                        .frame(minWidth: 0, maxWidth: 15)
                                        .frame(minHeight: 0, maxHeight: 15)
                                    TextField ("First Name", text: $firstName)
                                }  // HSTack
                                        .padding([.top,.bottom], 10)
                                        .padding(.leading, 5)
                                        .background(Color(red: 237/255, green: 239/255, blue: 238/255), alignment: .center)
                                        .cornerRadius(5)
                                Spacer(minLength: 20)
                            }.padding(.bottom)
                            Button("Next", action: {
                                if(!firstName.isEmpty){
                                    firstNameTrigger = true
                                }
                            }).padding()
                                .fontWeight(.bold)
                                .font(.subheadline)
                                .foregroundColor(firstName.isEmpty ? Color.gray :Color(red: 73/255, green: 94/255, blue: 87/255))
                                .background(Color(red: 237/255, green: 239/255, blue: 238/255))
                                .cornerRadius(20)
                        }
                    }
                    if(firstNameTrigger && !lastNameTrigger){
                        VStack{
                        HStack {
                            Spacer(minLength: 20)
                            HStack (alignment: .center,
                                    spacing: 10) {
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .frame(width: 15, height: 15, alignment: .center)
                                    .foregroundColor(.gray)
                                    .frame(minWidth: 0, maxWidth: 15)
                                    .frame(minHeight: 0, maxHeight: 15)
                                TextField ("Last Name", text: $lastName)
                            }  // HSTack
                                    .padding([.top,.bottom], 10)
                                    .padding(.leading, 5)
                                    .background(Color(red: 237/255, green: 239/255, blue: 238/255), alignment: .center)
                                    .cornerRadius(5)
                            Spacer(minLength: 20)
                        }.padding(.bottom)
                            HStack{
                                Button("Back", action: {
                                    firstNameTrigger = false
                                }).padding()
                                    .fontWeight(.bold)
                                    .font(.subheadline)
                                    .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                                    .background(Color(red: 237/255, green: 239/255, blue: 238/255))
                                    .cornerRadius(20)
                                Button("Next", action: {
                                    if(!lastName.isEmpty) {
                                        lastNameTrigger = true
                                    }
                                }).padding()
                                    .fontWeight(.bold)
                                    .font(.subheadline)
                                    .foregroundColor(firstName.isEmpty ? Color.gray :Color(red: 73/255, green: 94/255, blue: 87/255))
                                    .background(Color(red: 237/255, green: 239/255, blue: 238/255))
                                    .cornerRadius(20)
                            }
                    }
                }
                    if(firstNameTrigger && lastNameTrigger && !emailTrigger){
                        VStack{
                        HStack {
                            Spacer(minLength: 20)
                            HStack (alignment: .center,
                                    spacing: 10) {
                                Image(systemName: "mail.fill")
                                    .resizable()
                                    .frame(width: 15, height: 15, alignment: .center)
                                    .foregroundColor(.gray)
                                    .frame(minWidth: 0, maxWidth: 15)
                                    .frame(minHeight: 0, maxHeight: 15)
                                TextField ("Email", text: $email)
                            }  // HSTack
                                    .padding([.top,.bottom], 10)
                                    .padding(.leading, 5)
                                    .background(Color(red: 237/255, green: 239/255, blue: 238/255), alignment: .center)
                                    .cornerRadius(5)
                            Spacer(minLength: 20)
                        }.padding(.bottom)
                            HStack{
                                Button("Back", action: {
                                    lastNameTrigger = false
                                }).padding()
                                    .fontWeight(.bold)
                                    .font(.subheadline)
                                    .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                                    .background(Color(red: 237/255, green: 239/255, blue: 238/255))
                                    .cornerRadius(20)
                                Button("Register", action: {
                                    if(!email.isEmpty){
                                        print(firstName)
                                        print(lastName)
                                        print(email)
                                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                                        UserDefaults.standard.set(lastName, forKey: kLastName)
                                        UserDefaults.standard.set(email, forKey: kEmail)
                                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                                        isLoggedIn = true
                                    }
                                }).padding()
                                    .fontWeight(.bold)
                                    .font(.subheadline)
                                    .foregroundColor(firstName.isEmpty ? Color.gray :Color(red: 73/255, green: 94/255, blue: 87/255))
                                    .background(Color(red: 237/255, green: 239/255, blue: 238/255))
                                    .cornerRadius(20)
                            }
                    }
                }
                }.padding()
                Spacer()
                
                Text("Little Lemon iOS Capstone")
                
            }.onAppear(){
                if(UserDefaults.standard.bool(forKey: kIsLoggedIn)){
                    isLoggedIn = true
                }
                
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
