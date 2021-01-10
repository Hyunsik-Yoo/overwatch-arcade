import RxSwift
import RxCocoa

class HistoryViewModel: BaseViewModel {
  
  let input = Input()
  let output = Output()
  
  let overwatchService: OverwatchServiceProtocol
  
  struct Input {
    let tapCell = PublishSubject<Int>()
  }
  
  struct Output {
    let arcades = PublishRelay<[Arcade]>()
    let goToDetail = PublishRelay<Arcade>()
    let showSystemAlert = PublishRelay<AlertContent>()
  }
  
  
  init(overwatchService: OverwatchServiceProtocol) {
    self.overwatchService = overwatchService
    super.init()
    
    self.input.tapCell
      .withLatestFrom(self.output.arcades) { $1[$0] }
      .bind(to: self.output.goToDetail)
      .disposed(by: disposeBag)
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
