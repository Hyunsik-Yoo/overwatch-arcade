struct Mode: Codable {
  var id: Int
  var image: String
  var name: String
  var players: String
  
  init(id: Int, image: String, name: String, players: String) {
    self.id = id
    self.image = image
    self.name = name
    self.players = players
  }
  
  init(map: [String: Any]) {
    self.id = map["id"] as! Int
    self.image = map["image"] as! String
    self.name = map["name"] as! String
    self.players = map["players"] as! String
  }
  
  func toDict() -> [String: Any] {
    return [
      "id": id,
      "image": image,
      "name": name,
      "players": players
    ]
  }
}
