//
//  Menu.swift
//  LittleLemonResturant
//
//  Created by Tim Preskenis on 3/7/23.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var searchText = ""
    
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [
            NSSortDescriptor(key: "title", ascending: true, selector:  #selector(NSString.localizedStandardCompare))
        ]
    }
    func buildPredicate() -> NSPredicate {
        if(searchText.isEmpty) {
            return NSPredicate(value: true)
        }
        else {
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
    }
    func test() {
        print("test")
    }
    
    func getMenuData() {
        PersistenceController().clear()
        let urlString = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in

            if let error = error {
                print(error)
            } else if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(MenuList.self, from: data) {
                    
                    for val in decodedResponse.menu {
                        let mealToAdd = Dish(context: viewContext)
                        mealToAdd.title = val.title
                        mealToAdd.image = val.image
                        mealToAdd.price = val.price
                        try? viewContext.save()
                        
                    }
                }
            } else {
                print(error ?? "error")
            }
        }
        task.resume()
    }
    
    var body: some View {
        VStack{
            VStack{
                ZStack{
                    HStack{
                        Image("LittleLemonLogo").resizable () .aspectRatio (contentMode: .fit).frame(width: 150)
                    }
                    HStack{
                        Spacer()
                        Image("profile-image-placeholder") .resizable () .aspectRatio (contentMode: .fill) .frame (width: 50, height: 50, alignment: .top) .cornerRadius (100)
                    }.padding(.trailing)
                }
                VStack{
                    HStack{
                        VStack(alignment: .leading, spacing: 5.0){
                            Text("Little Lemon")
                                .font(Font.custom("American Typewriter", size: 32.0))
                                .foregroundColor(Color(red: 244/255, green: 206/255, blue: 20/255))
                                .fontWeight(.semibold)
                            Text("Chicago")
                                .font(Font.custom("American Typewriter", size: 24.0))
                                .foregroundColor(Color(red: 237/255, green: 239/255, blue: 238/255))
                            Text("We are a family owned Mediterranean restuaurant, focused on traditional recipes served with a modern twist.")
                                .foregroundColor(Color(red: 237/255, green: 239/255, blue: 238/255))
                        }.padding()
                        Spacer()
                        Image("Hero image").resizable () .aspectRatio (contentMode: .fit) .frame (width: 120, alignment: .top) .cornerRadius (20)
                            .padding()
                    }.background(Color(red: 73/255, green: 94/255, blue: 87/255))
                    HStack {
                        Spacer(minLength: 20)
                        HStack (alignment: .center,
                                spacing: 10) {
                            Image(systemName: "magnifyingglass")
                                        .resizable()
                                        .frame(width: 15, height: 15, alignment: .center)
                                        .foregroundColor(.gray)
                                        .frame(minWidth: 0, maxWidth: 15)
                                        .frame(minHeight: 0, maxHeight: 15)
                                    TextField ("Search Menu", text: $searchText)
                        }  // HSTack
                            .padding([.top,.bottom], 2)
                            .padding(.leading, 5)
                            .background(Color.white, alignment: .center)
                            .cornerRadius(5)
                        Spacer(minLength: 20)
                    }.padding(.bottom)
                }.background(Color(red: 73/255, green: 94/255, blue: 87/255))
            }
            VStack(alignment: .leading){
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
            }.padding(.top)
            FetchedObjects(predicate: buildPredicate(), sortDescriptors:buildSortDescriptors()) { (dishes: [Dish]) in List(dishes){dishinfo in
                HStack{
                    Text(dishinfo.title ?? "UNK")
                    Text(dishinfo.price ?? "UNK")
                    AsyncImage(url: URL(string: dishinfo.image!))  { phase in
                        if let image = phase.image {
                            image.resizable().aspectRatio (contentMode: .fill) .frame (width: 75, height: 75, alignment: .top) .cornerRadius (100)
                        
                        } else if phase.error != nil {
                            ProgressView()
                        } else {
                            ProgressView()
                        }
                    }
                }
            }}
            
        }
        .onAppear(){
            getMenuData()
        }
    }
}
