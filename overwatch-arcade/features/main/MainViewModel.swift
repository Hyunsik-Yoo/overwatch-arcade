import Combine
import SwiftUI

class MainViewModel: ObservableObject {
  
  @Published var predictedValue = 0
  @Published var iconOpacity = 1.0
  @Published var titleText = ""
  @Published var todayDate = "0000.00.00"
  @Published var mode1: Mode? = nil
  @Published var mode2: Mode? = nil
  @Published var mode3: Mode? = nil
  @Published var mode4: Mode? = nil
  @Published var mode5: Mode? = nil
  @Published var mode6: Mode? = nil
  @Published var mode7: Mode? = nil
  
  var overwatchService: OverwatchServiceProtocol
  
  var setCancellable = Set<AnyCancellable>()
  let totalMayhemFilter = PassthroughSubject<Bool, Never>()
  
  
  init(overwatchService: OverwatchServiceProtocol) {
    self.overwatchService = overwatchService
    self.totalMayhemFilter.sink { isTodayTotalMayhem in
      if isTodayTotalMayhem {
        self.titleText = "오늘은 난장판입니다!\n함께 즐겨요!"
        self.iconOpacity = 1.0
        self.startOpacityAnimation()
      } else {
        self.titleText = "오늘은 난장판이 아닙니다..\n다음 기회에.."
        self.iconOpacity = 0.5
      }
    }.store(in: &setCancellable)
    self.setTodayDate()
  }
  
  func fetchArcade() {
    self.overwatchService.getArcade().sink(receiveCompletion: { completion in
      
    }) { [weak self] arcade in
      guard let self = self else { return }
      let isTodayMayhem = arcade.getModes().contains { mode in
        mode.id == 62
      }
      self.mode1 = arcade.modes.tile_1
      self.mode2 = arcade.modes.tile_2
      self.mode3 = arcade.modes.tile_3
      self.mode4 = arcade.modes.tile_4
      self.mode5 = arcade.modes.tile_5
      self.mode6 = arcade.modes.tile_6
      self.mode7 = arcade.modes.tile_7

      self.totalMayhemFilter.send(isTodayMayhem)
    }.store(in: &setCancellable)
  }
  
  func setTodayDate() {
    let date = Date()
    let formatter = DateFormatter()
    
    formatter.dateFormat = "yyyy-MM-dd"
    self.todayDate = formatter.string(from: date)
  }
  
  private func startOpacityAnimation() {
    withAnimation(Animation.easeInOut(duration: 1).repeatForever()) {
      self.iconOpacity = 0
    }
  }
}
