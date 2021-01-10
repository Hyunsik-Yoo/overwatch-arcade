import RxSwift

class OverwatchMockService: OverwatchServiceProtocol {
  
  func fetchArcade() -> Observable<Arcade> {
    return Observable.create { observer -> Disposable in
      
      return Disposables.create()
    }
  }
  
  func fetchModes() -> Observable<[Mode]> {
    return Observable.create { observer -> Disposable in
      
      return Disposables.create()
    }
  }
  
  func fetchArcadeHistory() -> Observable<[Arcade]> {
    return Observable.create { observer -> Disposable in
      let history: [Arcade] = DataUtils.loadData("HistoryResponse.json")
      
      observer.onNext(history)
      observer.onCompleted()
      return Disposables.create()
    }
  }
}
