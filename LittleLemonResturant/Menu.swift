//
//  Menu.swift
//  LittleLemonResturant
//
//  Created by Tim Preskenis on 3/7/23.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    func getMenuData() {
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
                        print(val.title)
                        
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
            List{
                
            }
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
