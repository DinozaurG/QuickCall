//
//  ContentView.swift
//  QuickCall
//
//  Created by Алексей Шумейко on 11.04.2021.
//

import SwiftUI

struct ContactsView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \ContactEntity.id, ascending: true)], animation: .default)
        private var contacts: FetchedResults<ContactEntity>
    var viewModel: QuickCallViewModel
    var body: some View {
        NavigationView {
            List {
                ForEach(contacts) { contact in
                    Text("\(contact.name!)")
                }
            }
            .navigationTitle("My contacts")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        withAnimation {
                            viewRouter.currentView = .SettingsView
                        }
                    }) {
                        Text("Back")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        viewModel.getContactsFromBook(viewContext: viewContext)
                    }) {
                        Image(systemName: "plus.circle")
                    }
                }
            }
        }
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        let previewViewModel = QuickCallViewModel()
        ContactsView(viewModel: previewViewModel).environmentObject(ViewRouter()).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

