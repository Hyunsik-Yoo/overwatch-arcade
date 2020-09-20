import Combine
import SwiftUI

class MainViewModel: ObservableObject {
  
  var mode1: Mode!
  var mode2: Mode!
  var mode3: Mode!
  var mode4: Mode!
  var mode5: Mode!
  var mode6: Mode!
  var mode7: Mode!
  
  var overwatchService: OverwatchServiceProtocol
  
  
  init(overwatchService: OverwatchServiceProtocol) {
    self.overwatchService = overwatchService
  }
  
  func fetchArcade() {
    self.overwatchService.getArcade().sink(receiveCompletion: { completion in
      
    }) { [weak self] arcade in
      guard let self = self else { return }
      self.mode1 = arcade.modes.tile_1
      self.mode2 = arcade.modes.tile_2
      self.mode3 = arcade.modes.tile_3
      self.mode4 = arcade.modes.tile_4
      self.mode5 = arcade.modes.tile_5
      self.mode6 = arcade.modes.tile_6
      self.mode7 = arcade.modes.tile_7
    }
  }
}
