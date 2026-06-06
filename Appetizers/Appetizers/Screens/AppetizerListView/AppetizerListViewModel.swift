//
//  AppetizerListVieModel.swift
//  Appetizers
//
//  Created by Zahur-Afzal Mirza on 30/03/26.
//

import Combine
import Foundation

@MainActor
final class AppetizerListViewModel: ObservableObject {

    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?

    private let networkManager: NetworkManager

    init(networkManager: NetworkManager = .shared) {
        self.networkManager = networkManager
    }

//    func getAppetizers() {
//        isLoading = true
//            self.networkManager.getAppetizer { result in
//                DispatchQueue.main.async { [self] in
//                    isLoading = false
//                    switch result {
//                        
//                    case .success(let appetizers):
//                        self.appetizers = appetizers
//                        
//                    case .failure(let error):
//                        switch error {
//                            
//                        case .invalidData:
//                            alertItem = AlertContext.invalidData
//                            
//                        case .invalidURL:
//                            alertItem = AlertContext.invalidURL
//                            
//                        case .invalidResponse:
//                            alertItem = AlertContext.invalidResponse
//                            
//                        case .unableToComplete:
//                            alertItem = AlertContext.unableToComplete
//                        }
//                    }
//                }
//            }
//    }
    
    func getAppetizers() {
        isLoading = true
        Task {
            do {
                appetizers = try await self.networkManager.getAppetizer()
                isLoading = false
            } catch {
                // catch automatically captures error
                if let apError = error as? APError {
                    switch apError {
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                        
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                        
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                } else {
                    //set to generic error
                    alertItem = AlertContext.invalidResponse //placeholder for educational purpose - replace later 
                }
                isLoading = false
            }
        }
    }
}
