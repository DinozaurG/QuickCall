//
//  ViewRouter.swift
//  QuickCall
//
//  Created by Алексей Шумейко on 10.02.2022.
//
import Foundation
import SwiftUI

enum Views {
    case SettingsView
    case ContactsView
}


class ViewRouter: ObservableObject {
    @Published var currentView: Views = .SettingsView
}
