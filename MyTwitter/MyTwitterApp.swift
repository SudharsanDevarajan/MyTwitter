//
//  MyTwitterApp.swift
//  MyTwitter
//
//  Created by htcuser on 26/07/22.
//

import SwiftUI
import Amplify
import AWSCognitoAuthPlugin
import AWSAPIPlugin
import AWSDataStorePlugin
import AWSS3StoragePlugin

@main
struct MyTwitterApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init(){
        configureAWS()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView()
                    .environmentObject(viewModel)
            }
            .environmentObject(viewModel)
            
        }
    }
    
    
    func configureAWS(){
        do{
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            let models = AmplifyModels()
            try Amplify.add(plugin: AWSAPIPlugin(modelRegistration: models))
            try Amplify.add(plugin: AWSDataStorePlugin(modelRegistration: models ))
            try Amplify.add(plugin: AWSS3StoragePlugin())
            try Amplify.configure()
            print("AWS Configuration success..")
        }catch{
            print("Error configuring AWS")
        }
    }
}
