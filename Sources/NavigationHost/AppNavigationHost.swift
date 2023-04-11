//
//  AppNavigationHost.swift
//  Mastermind
//
//  Created by Hanan on 01/04/2023.
//

import SwiftUI

public struct AppNavigationHost<Screen: View>: View {
            
    let navigation: AppNavigation
    @ViewBuilder let rootView: () -> Screen
    
    public init(_ navigation: AppNavigation, @ViewBuilder _ rootView: @escaping () -> Screen) {
        self.navigation = navigation
        self.rootView = rootView
    }

    public var body: some View {
        AppNavigationControllerHost(
            navigation,
            rootView
        )
    }
}
