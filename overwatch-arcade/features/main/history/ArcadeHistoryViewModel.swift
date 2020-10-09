import SwiftUI
import Combine
import FirebaseFirestore

class ArcadeHistoryViewModel: ObservableObject {
  
  @Published var arcades: [Arcade]? = nil
  
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
}
