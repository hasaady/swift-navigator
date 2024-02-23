//
//  NavigationHost.swift
//  Mastermind
//
//  Created by Hanan on 01/04/2023.
//

import SwiftUI

public struct NavigationHost<Screen: View>: View {
            
    private let navigator: Navigator
    @ViewBuilder private let root: () -> Screen
    
    public init(_ navigator: Navigator, @ViewBuilder root: @escaping () -> Screen) {
        self.navigator = navigator
        self.root = root
    }

    public var body: some View {
        NavigationControllerHost(
            navigator: navigator,
            root: root
        )
    }
}
