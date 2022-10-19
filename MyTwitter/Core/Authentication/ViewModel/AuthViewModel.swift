//
//  AuthViewModel.swift
//  MyTwitter
//
//  Created by htcuser on 28/07/22.
//

import SwiftUI
import Amplify
import AWSCognitoAuthPlugin

class AuthViewModel: ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    
    @Published var isOTPSent = false
    @Published var isLoggin = false
    
    init(){
        checkAuthStatus()
    }
    
    // Check is already SignedIn
    func checkAuthStatus(){
        _ =  Amplify.Auth.fetchAuthSession(listener: { result in
            switch result{
            case .success(let status):
                print("Auth status \(status.isSignedIn)")
                DispatchQueue.main.async {
                    self.isLoggin = status.isSignedIn
                }
            case .failure(let error):
                print("Auth session status check failure \(error)")
            }
        })
    }
    
    
    // Sign up
    func register(email: String,pwd: String){
        let userAttributes = [AuthUserAttribute(.email ,value: email)]
        let signUpOptions = AuthSignUpRequest.Options(userAttributes: userAttributes)
        
        Amplify.Auth.signUp(username: email, password: pwd, options: signUpOptions) { result in
            switch result{
            case .success(let signUpResult):
                if case let .confirmUser(deliveryDetails,_) = signUpResult.nextStep{
                    print("Delivery details \(String(describing: deliveryDetails))")
                    DispatchQueue.main.async {
                        self.isOTPSent = true
                    }
                } else {
                    print("SignUp Complete")
                }
            case .failure(let error):
                print("An error occurred while registering a user \(error)")
            }
        }
    }
    
    
    // confirm OTP
    func confirmCode(with confirmCode: String){
        Amplify.Auth.confirmSignUp(for: email, confirmationCode: confirmCode) { result in
            switch result{
            case .success(let status):
                print("OTP Success",status.isSignupComplete)
                DispatchQueue.main.async {
                    self.isLoggin = status.isSignupComplete
                }
            case .failure(let error):
                print("OTP error occurred while confirming sign up \(error)")
            }
        }
    }
    
    // Sign in
    func login(){
        Amplify.Auth.signIn(username: email, password: password) { result in
              switch result {
              case .success:
                  print("Sign in Success")
                  DispatchQueue.main.async {
                      self.isLoggin = true
                  }
              case .failure(let error):
                  print("Sign in failed \(error)")
              }
          }
    }
    
   
    // Sign Out
    func SignOut(){
        Amplify.Auth.signOut { result in
            switch result{
            case .success():
                print("Sign out success")
                DispatchQueue.main.async {
                    self.isLoggin = false
                }
            case .failure(let error):
                print("Sign out failed with error \(error)")
            }
        }
    }
    
    func addUser(fullname: String,username: String,email: String){
        let user = Users(email: email,
                         fullname: fullname,
                         username: username,
                         profileImageurl: "https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510__480.jpg")
        
        Amplify.DataStore.save(user) { result in
            switch result{
            case .success(let createdUser):
                print("Profile saved \(createdUser.id)")
            case .failure(let error):
                print("Profile not created \(error)")
            }
        }
    }
}
