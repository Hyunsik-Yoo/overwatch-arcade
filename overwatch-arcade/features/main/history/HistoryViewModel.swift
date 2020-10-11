import SwiftUI
import Combine
import FirebaseFirestore

class HistoryViewModel: ObservableObject {
  
  @Published var arcades: [Arcade] = [] {
    didSet {
      print("arcades count: \(arcades.count)")
    }
  }
  @Published var test: [String] = []
  
  let overwatchService: OverwatchServiceProtocol
  var setCancellable = Set<AnyCancellable>()
  
  init(overwatchService: OverwatchServiceProtocol) {
    self.overwatchService = overwatchService
  }
  
  
  func fetchArcadeHistory() {
    self.overwatchService.getArcadeHistory().sink { completion in

    } receiveValue: { arcades in
      self.arcades = arcades
    }.store(in: &setCancellable)
  }
  
  func fetchRatio() {
    test = ["1","2","3","4"]
  }
}
