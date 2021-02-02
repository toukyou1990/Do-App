//
//  Do__Widget.swift
//  Do!!Widget
//
//  Created by Notty on 2021/02/02.
//

import WidgetKit
import SwiftUI

var text = ""
struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), text: "")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), text: "")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

                let userDefaults = UserDefaults(suiteName: "group.notty1990-gmail.com.Do--")
                if let userDefaults = userDefaults {
                    text = userDefaults.string(forKey: "inputText") ?? ""
                }

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, text: text)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let text: String
}

struct Do__WidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack{
            Image("logoB")
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .opacity(0.1)
                .padding(.bottom, 32.0)
            Text(entry.text)
        }
    }
}

@main
struct Do__Widget: Widget {
    let kind: String = "Do__Widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Do__WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct Do__Widget_Previews: PreviewProvider {
    static var previews: some View {
        Do__WidgetEntryView(entry: SimpleEntry(date: Date(),text: ""))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
