//
//  ExploreViewModel.swift
//  MyTwitter
//
//  Created by htcuser on 29/07/22.
//

import SwiftUI
import Amplify

class ExploreViewModel: ObservableObject{
    @Published var users = [Users]()
    
    func fetchUsers(){
        Amplify.DataStore.query(Users.self) { results in
            do{
                let user =  try results.get()
                DispatchQueue.main.async {
                    self.users = user
                }
                print("Total users \(user)")
            }catch{
                print("fetching users error")
            }
        }
    }
}
