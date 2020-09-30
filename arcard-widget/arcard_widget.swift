import WidgetKit
import SwiftUI
import Intents

@main
struct arcard_widget: Widget {
  let kind: String = "arcard_widget"
  
  var body: some WidgetConfiguration {
    IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
      WidgetView(entry: entry)
    }
    .configurationDisplayName("오버워치 난장판")
    .description("오늘 난장판 있는지 알려드림!")
  }
}

struct arcard_widget_Previews: PreviewProvider {
  static var previews: some View {
    WidgetView(
      entry: ArcadeEntry(date: Date(), configuration: ConfigurationIntent(), isTotalMayhem: true))
      .previewContext(WidgetPreviewContext(family: .systemSmall))
  }
}

