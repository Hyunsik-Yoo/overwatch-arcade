import UIKit

class HistoryView: BaseView {
  
  let backButton = UIButton().then {
    $0.setImage(UIImage(named: "ic_back"), for: .normal)
  }
  
  let titleLabel = UILabel().then {
    $0.textColor = .white
    $0.font = UIFont(name: "koverwatch", size: 24)
    $0.text = "history_title".localized
  }
  
  let headerContainer = UIView().then {
    $0.backgroundColor = UIColor(r: 21, g: 21, b: 21)
  }
  
  let descriptionLabel = UILabel().then {
    $0.text = "2020년 9월 30일부터 아케이드 모드 기록입니다."
    $0.textColor = UIColor(r: 108, g: 108, b: 108)
    $0.font = UIFont(name: "koverwatch", size: 12)
  }
  
  let historyTableView = UITableView().then {
    $0.tableFooterView = UIView()
    $0.allowsSelection = false
    $0.backgroundColor = .clear
    $0.separatorStyle = .none
  }
  
  
  override func setup() {
    backgroundColor = UIColor(r: 28, g: 30, b: 31)
    addSubViews(backButton, titleLabel, headerContainer, descriptionLabel, historyTableView)
  }
  
  override func bindConstraints() {
    self.backButton.snp.makeConstraints { make in
      make.left.equalToSuperview().offset(24 * RatioUtils.widthRatio)
      make.top.equalTo(safeAreaLayoutGuide).offset(16)
    }
    
    self.titleLabel.snp.makeConstraints { make in
      make.left.equalTo(self.backButton.snp.right).offset(16)
      make.centerY.equalTo(self.backButton)
    }
    
    self.headerContainer.snp.makeConstraints { make in
      make.left.right.equalToSuperview()
      make.top.equalTo(self.titleLabel.snp.bottom).offset(16)
      make.height.equalTo(44)
    }
    
    self.descriptionLabel.snp.makeConstraints { make in
      make.left.equalToSuperview().offset(24)
      make.centerY.equalTo(self.headerContainer)
    }
    
    self.historyTableView.snp.makeConstraints { make in
      make.left.right.bottom.equalToSuperview()
      make.top.equalTo(self.headerContainer.snp.bottom)
    }
  }
}
