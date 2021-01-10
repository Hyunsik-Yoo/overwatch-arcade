import UIKit
import RxSwift

class HistoryDetailVC: BaseVC {
  
  private lazy var historyDetailView = HistoryDetailView(frame: self.view.frame)
  private let arcade: Arcade
  
  
  static func instance(arcade: Arcade) -> HistoryDetailVC {
    return HistoryDetailVC(arcade: arcade)
  }
  
  init(arcade: Arcade) {
    self.arcade = arcade
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view = historyDetailView
    
    self.initilizeTableView()
    
    Observable.from(optional: self.arcade.getModes()).bind(to: self.historyDetailView.modeTableView.rx.items(
      cellIdentifier: HistoryDetailCell.registerId,
      cellType: HistoryDetailCell.self
    )) { row, mode, cell in
      cell.bind(mode: mode)
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
