struct Arcade: Codable {
  var created_at = ""
  var is_today = true
  var modes: Modes
  
  func getModes() -> [Mode] {
    return [
      modes.tile_1, modes.tile_2, modes.tile_3, modes.tile_4,
      modes.tile_5, modes.tile_6, modes.tile_7
    ]
  }
  
  func toDict() -> [String: Any] {
    return [
      "modes": modes.toDict()
    ]
  }
}
