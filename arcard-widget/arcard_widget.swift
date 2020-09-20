import WidgetKit
import SwiftUI
import Intents
import Alamofire

struct Provider: IntentTimelineProvider {
  func placeholder(in context: Context) -> ArcadeEntry {
    return ArcadeEntry(
      date: Date(),
      configuration: ConfigurationIntent(),
      isTotalMayhem: true
    )
  }
  
  func getSnapshot(
    for configuration: ConfigurationIntent,
    in context: Context,
    completion: @escaping (ArcadeEntry) -> ()
  ) {
    let entry = ArcadeEntry(
      date: Date(),
      configuration: configuration,
      isTotalMayhem: true
    )
    
    completion(entry)
  }
  
  func getTimeline(
    for configuration: ConfigurationIntent,
    in context: Context,
    completion: @escaping (WidgetKit.Timeline<ArcadeEntry>) -> ()
  ) {
    let currentDate = Date()
    let refreshDate = Calendar.current.date(byAdding: .hour, value: 1, to: currentDate)!
    
    getArcadeInfo { isTotalMayhemToday in
      let entry = ArcadeEntry(
        date: currentDate,
        configuration: configuration,
        isTotalMayhem: isTotalMayhemToday
      )

      let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
      completion(timeline)
    }
  }
  
  private func getArcadeInfo(completion: @escaping ((Bool) -> Void)) {
    let urlString = "https://overwatcharcade.today/api/overwatch/today"
    
    Alamofire.request(urlString, method: .get).responseJSON { response in
      if let value = response.value {
        let arcade: Arcade = JsonUtils.toJson(object: value)!
        if arcade.modes.tile_1.id == 62 {
          completion(true)
        } else if arcade.modes.tile_2.id == 62 {
          completion(true)
        } else if arcade.modes.tile_3.id == 62 {
          completion(true)
        } else if arcade.modes.tile_4.id == 62 {
          completion(true)
        } else if arcade.modes.tile_5.id == 62 {
          completion(true)
        } else if arcade.modes.tile_6.id == 62 {
          completion(true)
        } else if arcade.modes.tile_7.id == 62 {
          completion(true)
        } else {
          completion(false)
        }
      }
    }
  }
}

struct ArcadeEntry: TimelineEntry {
  let date: Date
  let configuration: ConfigurationIntent
  let isTotalMayhem: Bool
}

struct arcard_widgetEntryView : View {
  var entry: Provider.Entry
  
  var body: some View {
    if entry.isTotalMayhem {
      ZStack {
        Image("total")
          .resizable()
          .aspectRatio(contentMode: .fill)
        
        VStack {
          Spacer()
          
          Text("오늘은 난장판!")
            .font(Font.custom("koverwatch", size: 25))
            .foregroundColor(.white)
            .padding(.bottom, 30)
        }
      }
    } else {
      ZStack {
        Color.red
        
        VStack {
          Spacer()
          
          Text("오늘은 난장판 아님!")
            .font(Font.custom("koverwatch", size: 25))
            .foregroundColor(.white)
            .padding(.bottom, 30)
        }
      }
    }
  }
}

@main
struct arcard_widget: Widget {
  let kind: String = "arcard_widget"
  
  var body: some WidgetConfiguration {
    IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
      arcard_widgetEntryView(entry: entry)
    }
    .configurationDisplayName("오버워치 난장판")
    .description("오늘 난장판 있는지 알려드림!")
  }
}

struct arcard_widget_Previews: PreviewProvider {
  static var previews: some View {
    arcard_widgetEntryView(
      entry: ArcadeEntry(date: Date(), configuration: ConfigurationIntent(), isTotalMayhem: true))
      .previewContext(WidgetPreviewContext(family: .systemSmall))
  }
}

