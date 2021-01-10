import RxSwift
import RxCocoa

class HistoryViewModel: BaseViewModel {
  
  let output = Output()
  
  let overwatchService: OverwatchServiceProtocol
  
  struct Output {
    let arcades = PublishRelay<[Arcade]>()
    let showSystemAlert = PublishRelay<AlertContent>()
  }
  
  
  init(overwatchService: OverwatchServiceProtocol) {
    self.overwatchService = overwatchService
    super.init()
  }
  
  func fetchArcades() {
    self.overwatchService.fetchArcadeHistory().subscribe(
      onNext: self.output.arcades.accept,
      onError: { error in
        if let error = error as? CommonError {
          let alertContent = AlertContent(title: "Error in fetchArcades", message: error.description)
          
          self.output.showSystemAlert.accept(alertContent)
        }
      }
    )
    .disposed(by: disposeBag)
  }
}
