//
//  QuickCallWidget.swift
//  QuickCallWidget
//
//  Created by Алексей Шумейко on 17.02.2022.
//

import WidgetKit
import SwiftUI
import QuickCall

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), contacts: Contacts())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), contacts: Contacts())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, contacts: Contacts())
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let contacts: Contacts
}

struct QuickCallWidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var family
    var viewModel: QuickCallWidgetViewModel
    @ViewBuilder
    var body: some View {
        switch family {
        case .systemMedium:
            let contacts = viewModel.getContactsToWidget(count: 4)
            FourContactsView(contacts: contacts)
        case .systemLarge:
            let contacts = viewModel.getContactsToWidget(count: 8)
            EightContactsView(contacts: contacts)
        default:
            let contacts = viewModel.getContactsToWidget(count: 1)
            OneContactView(contacts: contacts)
        }
    }
}

struct OneContactView : View {
    var contacts: Array<Contacts.Contact>
    var body: some View {
        HStack {
            ForEach(contacts) { contact in
                Text("\(contact.name)!")
            }
        }
    }
}

struct FourContactsView : View {
    var contacts: Array<Contacts.Contact>
    var body: some View {
        HStack {
            ForEach(contacts) { contact in
                Text("\(contact.name)!")
            }
        }
    }
}

struct EightContactsView : View {
    var contacts: Array<Contacts.Contact>
    var body: some View {
        HStack {
            ForEach(contacts) { contact in
                Text("\(contact.name)!")
            }
        }
    }
}

@main
struct QuickCallWidget: Widget {
    let kind: String = "QuickCallWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            QuickCallWidgetEntryView(entry: entry, viewModel: QuickCallWidgetViewModel())
        }
        .configurationDisplayName("QuickCall")
        .description("Pick your contacts in app, and send call and SMS")
    }
}

struct QuickCallWidget_Previews: PreviewProvider {
    static var previews: some View {
        let previewViewModel = QuickCallWidgetViewModel()
        QuickCallWidgetEntryView(entry: SimpleEntry(date: Date(), contacts: Contacts()), viewModel: previewViewModel)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
