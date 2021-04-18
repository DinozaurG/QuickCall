//
//  ContentView.swift
//  QuickCall
//
//  Created by Алексей Шумейко on 11.04.2021.
//

import SwiftUI
import ContactsUI
import CoreData

struct SettingsView: View {
    var body: some View {
        VStack(spacing: -40) {
            ForEach(0..<3) { index in
                ButtonsView()
            }.padding()
        }
    }
}

struct ButtonsView: View {
    var body: some View {
        ZStack() {
            RoundedRectangle(cornerRadius: 25.0).fill(Color.white)
            RoundedRectangle(cornerRadius: 25.0).stroke(lineWidth: 3).foregroundColor(.yellow)
            Text("Contacts")
        }
    }
}
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
