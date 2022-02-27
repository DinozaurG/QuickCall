//
//  ContentView.swift
//  QuickCall
//
//  Created by Алексей Шумейко on 11.04.2021.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var viewModel: QuickCallViewModel
    var body: some View {
        VStack(spacing: -40) {
            Button(action: {
                withAnimation {
                    viewRouter.currentView = .ContactsView
                }
            }) {
                ButtonsView(ButtonTitle: "Contacts").padding()
            }
            //ButtonsView(ButtonTitle: "Synchonize").padding()
            ButtonsView(ButtonTitle: "Connect to your Social Network").padding()
        }
    }
}

struct ButtonsView: View {
    var ButtonTitle: String
    var body: some View {
        ZStack() {
            RoundedRectangle(cornerRadius: 25.0).fill(Color.white)
            RoundedRectangle(cornerRadius: 25.0).stroke(lineWidth: 3).foregroundColor(.yellow)
            Text(ButtonTitle)
        }
    }
}
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        let previewViewModel = QuickCallViewModel()
        SettingsView(viewModel: previewViewModel).environmentObject(ViewRouter())
    }
}
