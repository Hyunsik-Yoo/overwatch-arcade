import RxSwift
import RxCocoa

class HistoryViewModel: BaseViewModel {
  
  let input = Input()
  let output = Output()
  
  var modes: [Int: Mode] = .init()
  let overwatchService: OverwatchServiceProtocol
  
  struct Input {
    let tapCell = PublishSubject<Int>()
  }
  
  struct Output {
    let modes = PublishRelay<[Mode]>()
    let history = PublishRelay<[Arcade]>()
    let goToDetail = PublishRelay<(Arcade, [Int: Mode])>()
    let showSystemAlert = PublishRelay<AlertContent>()
  }
  
  
  init(overwatchService: OverwatchServiceProtocol) {
    self.overwatchService = overwatchService
    super.init()
    
    self.input.tapCell
      .withLatestFrom(self.output.history) { ($1[$0], self.modes) }
      .bind(to: self.output.goToDetail)
      .disposed(by: disposeBag)
  }
  
  func fetchModes() {
    self.overwatchService.fetchModes().subscribe(
      onNext: { modes in
        self.modes = modes.toDictionary { $0.id }
        self.fetchHistory()
      },
      onError: { error in
        if let error = error as? CommonError {
          let alertContent = AlertContent(title: "Error in fetchArcades", message: error.description)
          
          self.output.showSystemAlert.accept(alertContent)
        }
      }
    )
    .disposed(by: disposeBag)
  }
  
  func fetchHistory() {
    self.overwatchService.fetchArcadeHistory().subscribe(
      onNext: self.output.history.accept,
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
