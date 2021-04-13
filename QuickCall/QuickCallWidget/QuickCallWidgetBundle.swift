//
//  QuickCallWidgetBundle.swift
//  QuickCall
//
//  Created by Алексей Шумейко on 11.04.2021.
//

import SwiftUI
import WidgetKit

@main
struct EmojiWidgetBundle: WidgetBundle {

  @WidgetBundleBuilder
  var body: some Widget {
    QuickCallWIdget()
  }
}
