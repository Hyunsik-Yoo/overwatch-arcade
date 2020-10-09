struct Mode: Codable {
  var id: Int
  var image: String
  var name: String
  var players: String
  
  func toDict() -> [String: Any] {
    return [
      "id": id,
      "image": image,
      "name": name,
      "players": players
    ]
  }
}
