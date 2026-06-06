//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//
//  Created by Zahur-Afzal Mirza on 20/02/26.
// 

import SwiftUI
import Combine

final class FrameworkGridViewModel: ObservableObject {

    var selectedFramework: Framework? {
        didSet { isShowingDetailView = true }
    }
    
    @Published var isShowingDetailView = false
     
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible()) ]
}
