//
//  AccountView.swift
//  Appetizers
//
//  Created by Zahur-Afzal Mirza on 29/03/26.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject private var viewModel = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case firstname, lastname, email
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personl Info")) {
                    
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstname)
                        .onSubmit { focusedTextField = .lastname }
                        .submitLabel(.next)
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastname)
                        .onSubmit { focusedTextField = .email }
                        .submitLabel(.next)
                    
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit { focusedTextField = nil }
                        .submitLabel(.continue)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                    
                    Group {

                        
                        DatePicker("Birth Date",
                                   selection: $viewModel.user.birthdate,
                                   in: Date().oneHundredTenYearsAgo...Date().eighteenYearsAgo,
                                   displayedComponents: .date)
                        
                        Button {
                            viewModel.saveChanges()
                        } label: {
                            Text("Save Changes")
                        }
                    }.tint(.brandPrimary)
                }
                
                Section(header: Text("Requests")) {
                    Group {
                        Toggle("Extra Napkins", isOn: $viewModel.user.extraRequests)
                        
                        Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                    }
                    .tint(.brandPrimary)
                }
            }
            .navigationTitle("🤷🏻‍♂️ Account")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard, content: {
                    Button("Dismiss") { focusedTextField = nil }
                })
            }
        }
        .onAppear {
            viewModel.retriveUserData()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(
                title: alertItem.title,
                message: alertItem.message,
                dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AccountView()
}
