import UIKit
import RxSwift

class HistoryDetailVC: BaseVC {
  
  private lazy var historyDetailView = HistoryDetailView(frame: self.view.frame)
  private let arcade: Arcade
  private let modes: [Int: Mode]
  
  
  static func instance(arcade: Arcade, modes: [Int: Mode]) -> HistoryDetailVC {
    return HistoryDetailVC(arcade: arcade, modes: modes)
  }
  
  init(arcade: Arcade, modes: [Int: Mode]) {
    self.arcade = arcade
    self.modes = modes
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view = historyDetailView
    
    self.initilizeTableView()
    self.historyDetailView.bind(arcade: self.arcade)
    
    Observable.from(optional: self.arcade.getModes()).bind(to: self.historyDetailView.modeTableView.rx.items(
      cellIdentifier: HistoryDetailCell.registerId,
      cellType: HistoryDetailCell.self
    )) { row, mode, cell in
      let currentMode = self.modes[mode.id]
      
      cell.bind(mode: currentMode ?? mode)
    }
    .disposed(by: disposeBag)
  }
  
  override func bindEvent() {
    self.historyDetailView.backButton.rx.tap
      .observeOn(MainScheduler.instance)
      .bind(onNext: self.popupVC)
      .disposed(by: disposeBag)
  }
  
  private func popupVC() {
    self.navigationController?.popViewController(animated: true)
  }
  
  private func initilizeTableView() {
    self.historyDetailView.modeTableView.register(
      HistoryDetailCell.self,
      forCellReuseIdentifier: HistoryDetailCell.registerId
    )
  }
}
