//
//  QuickCallView.swift
//  QuickCall
//
//  Created by Алексей Шумейко on 10.02.2022.
//

import SwiftUI

struct QuickCallView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    let persistenceController = PersistenceController.shared
    var viewModel: QuickCallViewModel
    var body: some View {
        switch viewRouter.currentView {
        case .SettingsView:
            SettingsView(viewModel: viewModel)
        case .ContactsView:
            ContactsView(viewModel: viewModel).environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

struct QuickCallView_Previews: PreviewProvider {
    static var previews: some View {
        let previewModel = QuickCallViewModel()
        QuickCallView(viewModel: previewModel).environmentObject(ViewRouter())
    }
}
