import WidgetKit
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
    
    self.getArcadeInfo { isTotalMayhemToday in
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
        let isTotalMayhemToday = arcade.getModes().contains { $0.id == 62 }
        
        completion(isTotalMayhemToday)
      }
    }
  }
}

