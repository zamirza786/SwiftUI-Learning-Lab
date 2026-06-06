//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//
//  Created by Zahur-Afzal Mirza on 20/02/26.
// 

import SwiftUI
import Combine

final class FrameworkGridViewModel: ObservableObject {
     
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible()) ]
}
