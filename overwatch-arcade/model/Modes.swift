struct Modes: Codable {
  var tile_1: Mode
  var tile_2: Mode
  var tile_3: Mode
  var tile_4: Mode
  var tile_5: Mode
  var tile_6: Mode
  var tile_7: Mode
  
  func toDict() -> [String: Any] {
    return [
      "tile_1": tile_1.toDict(),
      "tile_2": tile_2.toDict(),
      "tile_3": tile_3.toDict(),
      "tile_4": tile_4.toDict(),
      "tile_5": tile_5.toDict(),
      "tile_6": tile_6.toDict(),
      "tile_7": tile_7.toDict()
    ]
  }
}
