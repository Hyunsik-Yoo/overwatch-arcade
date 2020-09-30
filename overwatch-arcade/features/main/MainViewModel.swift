import Combine
import SwiftUI

class MainViewModel: ObservableObject {
  
  @Published var predictedValue = 0
  @Published var isTodayTotalMayhem = false
  @Published var mode1: Mode? = nil
  @Published var mode2: Mode? = nil
  @Published var mode3: Mode? = nil
  @Published var mode4: Mode? = nil
  @Published var mode5: Mode? = nil
  @Published var mode6: Mode? = nil
  @Published var mode7: Mode? = nil
  
  var overwatchService: OverwatchServiceProtocol
  
  var setCancellable = Set<AnyCancellable>()
  
  
  init(overwatchService: OverwatchServiceProtocol) {
    self.overwatchService = overwatchService
  }
  
  func fetchArcade() {
    self.overwatchService.getArcade().sink(receiveCompletion: { completion in
      
    }) { [weak self] arcade in
      guard let self = self else { return }
      print(arcade)
      self.mode1 = arcade.modes.tile_1
      self.mode2 = arcade.modes.tile_2
      self.mode3 = arcade.modes.tile_3
      self.mode4 = arcade.modes.tile_4
      self.mode5 = arcade.modes.tile_5
      self.mode6 = arcade.modes.tile_6
      self.mode7 = arcade.modes.tile_7
    }.store(in: &setCancellable)
  }
}
