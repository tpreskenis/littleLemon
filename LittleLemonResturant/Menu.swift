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
    @State var categoryText = ""
    
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [
            NSSortDescriptor(key: "title", ascending: true, selector:  #selector(NSString.localizedStandardCompare))
        ]
    }
    func buildPredicate() -> NSPredicate {
        if(searchText.isEmpty && categoryText.isEmpty) {
            return NSPredicate(value: true)
        }
        else if(!categoryText.isEmpty && searchText.isEmpty) {
            return NSPredicate(format: "category CONTAINS[cd] %@", categoryText)
        }
        else if(!categoryText.isEmpty && !searchText.isEmpty){
            return NSPredicate(format: "(category CONTAINS[cd] %@) AND (title CONTAINS[cd] %@)", categoryText, searchText)
        }
        else {
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
    }
    func setCategoryMenu(name: String) {
        if(categoryText == name){
            categoryText = ""
        }
        else {
            categoryText = name
        }
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
                        mealToAdd.category = val.category
                        mealToAdd.menu_description = val.description
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
        ScrollView{
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
                        Button("Starters", action: {
                            setCategoryMenu(name:"starters")
                        }).padding()
                            .fontWeight(.bold)
                            .font(.subheadline)
                            .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                            .background((categoryText == "starters") ? Color(red: 244/255, green: 206/255, blue: 20/255) : Color(red: 237/255, green: 239/255, blue: 238/255))
                            .cornerRadius(20)
                        Button("Mains", action: {
                            setCategoryMenu(name:"mains")
                        }).padding()
                            .fontWeight(.bold)
                            .font(.subheadline)
                            .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                            .background((categoryText == "mains") ? Color(red: 244/255, green: 206/255, blue: 20/255) : Color(red: 237/255, green: 239/255, blue: 238/255))
                            .cornerRadius(20)
                        Button("Desserts", action: {
                            setCategoryMenu(name: "desserts")
                        }).padding()
                            .fontWeight(.bold)
                            .font(.subheadline)
                            .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                            .background((categoryText == "desserts") ? Color(red: 244/255, green: 206/255, blue: 20/255) : Color(red: 237/255, green: 239/255, blue: 238/255))
                            .cornerRadius(20)
                        Button("Drinks", action: {
                            setCategoryMenu(name: "drinks")
                        }).padding()
                            .fontWeight(.bold)
                            .font(.subheadline)
                            .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                            .background((categoryText == "drinks") ? Color(red: 244/255, green: 206/255, blue: 20/255) : Color(red: 237/255, green: 239/255, blue: 238/255))
                            .cornerRadius(20)
                    }
                }.padding(.top)
                Divider().padding(.top)
                FetchedObjects(predicate: buildPredicate(), sortDescriptors:buildSortDescriptors()) { (dishes: [Dish]) in ForEach(dishes, id: \.self){dishinfo in
                    VStack{
                        HStack{
                            VStack(alignment: .leading, spacing: 3.0){
                                Text(dishinfo.title ?? "UNK").fontWeight(.bold).foregroundColor(Color.black)
                                Text(dishinfo.menu_description ?? "UNK").foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255)).lineLimit(2)
                                Text("$").fontWeight(.semibold).foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255)) + Text(dishinfo.price ?? "UNK").fontWeight(.semibold).foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255)) + Text(".99").fontWeight(.semibold).foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                                
                            }
                            AsyncImage(url: URL(string: dishinfo.image!))  { phase in
                                if let image = phase.image {
                                    image.resizable().aspectRatio (contentMode: .fill) .frame (width: 75, height: 75, alignment: .top) .cornerRadius (20)
                                    
                                } else if phase.error != nil {
                                    Color.gray.frame(width: 75, height: 75, alignment: .top) .cornerRadius (20)
                                } else {
                                    Color.gray.frame(width: 75, height: 75, alignment: .top) .cornerRadius (20)
                                }
                            }
                        }.padding()
                        Divider()
                    }
                }}
            }
            .onAppear(){
                getMenuData()
            }
        }
    }
}
