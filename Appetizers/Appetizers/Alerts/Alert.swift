//
//  Alert.swift
//  Appetizers
//
//  Created by Zahur-Afzal Mirza on 30/03/26.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

enum AlertContext {
    
    //MARK:  Network Alerts
    static let invalidData = AlertItem(
        title: Text("Server Error"),
        message:
            Text("The data recieved from the server is invalid. Please contact support."),
        dismissButton: .default(Text("OK"))
    )

    static let invalidResponse = AlertItem(
        title: Text("Server Error"),
        message:
            Text("Invalid response from the server. Please try again later or contact support."),
        dismissButton: .default(Text("OK"))
    )

    
    static let invalidURL = AlertItem(
        title: Text("Server Error"),
        message:
            Text("There was an issue connecting with the server. If this persists, please contact support"),
        dismissButton: .default(Text("OK"))
    )

    
    static let unableToComplete = AlertItem(
        title: Text("Server Error"),
        message:
            Text("Unable to compelete your request at this time. Please check your internet connection"),
        dismissButton: .default(Text("OK"))
    )

    //MARK:  Account Alerts
    static let invalidForm = AlertItem(
         title: Text("Invalid Form"),
        message:
            Text("Please ensure all fields in the form have been filled out"),
        dismissButton: .default(Text("OK"))
    )
    
    static let invalidEmail = AlertItem(
         title: Text("Invalid Email"),
        message:
            Text("Please enter a valid E-mail address"),
        dismissButton: .default(Text("OK"))
    )
    
    static let userSavedSuccesfully = AlertItem(
         title: Text("Profile Saved"),
        message:
            Text("Your Profile information was succesfully saved"),
         dismissButton: .default(Text("OK"))
    )
    
    static let invalidUserData = AlertItem(
         title: Text("Profile Error"),
        message:
            Text("There was an error saving or retrieving your profile data"),
         dismissButton: .default(Text("OK"))
    )
}
