//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Zahur-Afzal Mirza on 01/04/26.
//

import SwiftUI
import Combine

final class AccountViewModel: ObservableObject {
    
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    @AppStorage("user") private var userData: Data?
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty  && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isvalidemail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        
        return true
    }
    
    func saveChanges() {
        guard isValidForm else { return }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSavedSuccesfully
        } catch {
            alertItem = AlertContext.invalidUserData
        }

    }
    
    func retriveUserData() {
        guard let userData = userData else { return }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext.invalidUserData
        }

    }
    
    
    init() {
        
    }
    
}
 
