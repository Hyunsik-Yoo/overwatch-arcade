import UIKit
import RxSwift

class MainVC: BaseVC {
  
  private lazy var mainView = MainView(frame: self.view.frame)
  private let viewModel = MainViewModel(overwatchService: OverwatchService())
  
  
  static func instance() -> MainVC {
    return MainVC(nibName: nil, bundle: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view = mainView
    
    self.viewModel.fetchArcades()
    self.viewModel.fetchTodayDate()
    self.viewModel.startRemainTimer()
  }
  
  override func bindViewModel() {
    self.viewModel.output.date
      .bind(to: self.mainView.dateLabel.rx.text)
      .disposed(by: disposeBag)
    
    self.viewModel.output.isMayhemToday
      .observeOn(MainScheduler.instance)
      .bind(onNext: self.mainView.setMayhem(isMayhemToday:))
      .disposed(by: disposeBag)
    
    self.viewModel.output.remainTime
      .bind(to: self.mainView.remainTimeLabel.rx.text)
      .disposed(by: disposeBag)
    
    self.viewModel.output.arcades
      .observeOn(MainScheduler.instance)
      .bind(onNext: self.mainView.bindArcade(arcade:))
      .disposed(by: disposeBag)
  }
  
  override func bindEvent() {
    self.mainView.historyButton.rx.tap
      .observeOn(MainScheduler.instance)
      .bind(onNext: self.goToHistory)
      .disposed(by: disposeBag)
  }
  
  private func goToHistory() {
    let historyVC = HistoryVC.instance()
    
    self.navigationController?.pushViewController(historyVC, animated: true)
  }
}
