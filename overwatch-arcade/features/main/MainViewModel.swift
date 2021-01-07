import RxSwift
import RxCocoa

class MainViewModel: BaseViewModel {
  
  let input = Input()
  let output = Output()
  let overwatchService: OverwatchServiceProtocol
  var remainTimer: Timer? = nil
  
  struct Input {
    
  }
  
  struct Output {
    let date = PublishRelay<String>()
    let isMayhemToday = PublishRelay<Bool>()
    let remainTime = PublishRelay<String>()
    let arcades = PublishRelay<Arcade>()
    let showSystemAlert = PublishRelay<AlertContent>()
  }
  
  init(overwatchService: OverwatchServiceProtocol) {
    self.overwatchService = overwatchService
    super.init()
  }
  
  func fetchArcades() {
    self.overwatchService.fetchArcade().subscribe(
      onNext: { arcade in
        let isMayhemToday = arcade.getModes().contains { $0.id == 62 }
        
        self.output.isMayhemToday.accept(isMayhemToday)
        self.output.arcades.accept(arcade)
      },
      onError: { error in
        if let error = error as? CommonError {
          let alertContent = AlertContent(
            title: "Error in fetchArcades",
            message: error.description
          )
          
          self.output.showSystemAlert.accept(alertContent)
        }
      }
    )
    .disposed(by: disposeBag)
  }
  
  func fetchTodayDate() {
    let date = Date()
    let formatter = DateFormatter()
    
    formatter.dateFormat = "yyyy-MM-dd"
    self.output.date.accept(formatter.string(from: date))
  }
  
  func startRemainTimer() {
    remainTimer = Timer.scheduledTimer(
      withTimeInterval: 1,
      repeats: true
    ) { timer in
      let nextDate = Calendar.current.date(
        bySettingHour: 9,
        minute: 0,
        second: 0,
        of: Date()
      )!.addingTimeInterval(60 * 60 * 24)
      let current = Date()
      
      self.setRemainTime(remainTime: Int(nextDate.timeIntervalSince(current)))
    }
  }
  
  private func setRemainTime(remainTime: Int) {
    let second = remainTime % 60
    let minutes = remainTime / 60 % 60
    let hours = remainTime / 60 / 60
    
    self.output.remainTime.accept(String(format: "%02d:%02d:%02d", hours, minutes, second))
  }
}
