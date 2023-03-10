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
            Text("Title")
            Text("Location")
            Text("This is a short description of the whole application below the two previous fields")
            TextField("Seach Menu", text: $searchText)
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

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
