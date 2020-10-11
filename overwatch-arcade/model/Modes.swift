struct Modes: Codable {
  var tile_1: Mode
  var tile_2: Mode
  var tile_3: Mode
  var tile_4: Mode
  var tile_5: Mode
  var tile_6: Mode
  var tile_7: Mode
  
  init(map: [String: Any]) {
    self.tile_1 = Mode(map: map["tile_1"] as! [String: Any])
    self.tile_2 = Mode(map: map["tile_2"] as! [String: Any])
    self.tile_3 = Mode(map: map["tile_3"] as! [String: Any])
    self.tile_4 = Mode(map: map["tile_4"] as! [String: Any])
    self.tile_5 = Mode(map: map["tile_5"] as! [String: Any])
    self.tile_6 = Mode(map: map["tile_6"] as! [String: Any])
    self.tile_7 = Mode(map: map["tile_7"] as! [String: Any])
  }
  
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
