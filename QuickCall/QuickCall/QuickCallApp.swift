//
//  QuickCallApp.swift
//  QuickCall
//
//  Created by Алексей Шумейко on 11.04.2021.
//

import SwiftUI

@main
struct QuickCallApp: App {
    @StateObject var viewRouter = ViewRouter()
    let persistenceController = PersistenceController.shared
    let quickCallViewModel = QuickCallViewModel()
    var body: some Scene {
        WindowGroup {
            QuickCallView(viewModel: quickCallViewModel).environmentObject(viewRouter)
        }
    }
}
