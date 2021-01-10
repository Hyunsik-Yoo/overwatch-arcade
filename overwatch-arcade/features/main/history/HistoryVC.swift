import RxSwift

class HistoryVC: BaseVC {
  
  private lazy var historyView = HistoryView(frame: self.view.frame)
  private let viewModel = HistoryViewModel(overwatchService: OverwatchService())
  
  
  static func instance() -> HistoryVC {
    return HistoryVC(nibName: nil, bundle: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view = historyView
    
    self.initilizeTableView()
    self.viewModel.fetchModes()
  }
  
  override func bindViewModel() {
    self.viewModel.output.history.bind(to: self.historyView.historyTableView.rx.items(
      cellIdentifier: HistoryCell.registerId,
      cellType: HistoryCell.self
    )) { row, arcade, cell in
      cell.bind(arcade: arcade, modes: self.viewModel.modes)
    }
    .disposed(by: disposeBag)
    
    self.viewModel.output.goToDetail
      .observeOn(MainScheduler.instance)
      .bind(onNext: self.goToDetail)
      .disposed(by: disposeBag)
    
    self.viewModel.output.showSystemAlert
      .observeOn(MainScheduler.instance)
      .bind(onNext: self.showSystemAlert(alert:))
      .disposed(by: disposeBag)
  }
  
  override func bindEvent() {
    self.historyView.backButton.rx.tap
      .observeOn(MainScheduler.instance)
      .bind(onNext: self.popupVC)
      .disposed(by: disposeBag)
  }
  
  private func initilizeTableView() {
    self.historyView.historyTableView.register(
      HistoryCell.self,
      forCellReuseIdentifier: HistoryCell.registerId
    )
    self.historyView.historyTableView.rx.setDelegate(self)
      .disposed(by: disposeBag)
  }
  
  private func popupVC() {
    self.navigationController?.popViewController(animated: true)
  }
  
  private func goToDetail(arcade: Arcade, modes: [Int: Mode]) {
    let detailVC = HistoryDetailVC.instance(arcade: arcade, modes: modes)
    
    self.navigationController?.pushViewController(detailVC, animated: true)
  }
}

extension HistoryVC: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.viewModel.input.tapCell.onNext(indexPath.row)
  }
}
