import Foundation

struct DateUtils {
  static func toDate(dateString: String) -> Date {
    let dateFormatter = DateFormatter().then {
      $0.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    }
    
    return dateFormatter.date(from: dateString) ?? Date()
  }
  
  static func getTodayString() -> String {
    let formatter = DateFormatter()
    
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter.string(from: Date())
  }
  
  static func getDateFromString(dateString: String) -> String {
    let date = toDate(dateString: dateString)
    let dateFormatter = DateFormatter().then {
      $0.dateFormat = "yyyy. MM. dd"
      $0.locale = Locale(identifier: "ko")
    }
    
    return dateFormatter.string(from: date)
  }
}
