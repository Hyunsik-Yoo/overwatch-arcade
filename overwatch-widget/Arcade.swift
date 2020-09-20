struct Arcade: Codable {
  var created_at: String
  var is_today: Bool
  var modes: Modes
}

struct Modes: Codable {
  var tile_1: Mode
  var tile_2: Mode
  var tile_3: Mode
  var tile_4: Mode
  var tile_5: Mode
  var tile_6: Mode
  var tile_7: Mode
}

struct Mode: Codable {
  var id: Int
  var image: String
  var name: String
  var players: String
}
