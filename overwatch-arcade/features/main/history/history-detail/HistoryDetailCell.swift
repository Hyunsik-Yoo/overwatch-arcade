import UIKit

class HistoryDetailCell: BaseTableViewCell {
  
  static let registerId = "\(HistoryDetailCell.self)"
  
  let modeImage = UIImageView().then {
    $0.layer.cornerRadius = 6
    $0.layer.masksToBounds = true
    $0.contentMode = .scaleAspectFill
  }
  
  let containerView = UIView().then {
    $0.layer.cornerRadius = 10
    $0.layer.masksToBounds = true
    $0.backgroundColor = UIColor(r: 249, g: 95, b: 95)
  }
  
  let typeLabel = UILabel().then {
    $0.textColor = .white
    $0.font = UIFont(name: "koverwatch", size: 12)
    $0.text = "3 v 3"
  }
  
  let nameLabel = UILabel().then {
    $0.linesCornerRadius = 3
    $0.textColor = .white
    $0.font = UIFont(name: "koverwatch", size: 20)
  }
  
  
  override func setup() {
    backgroundColor = .clear
    addSubViews(modeImage, containerView, typeLabel, nameLabel)
  }
  
  override func bindConstraints() {
    self.modeImage.snp.makeConstraints { make in
      make.left.equalToSuperview().offset(24)
      make.top.equalToSuperview().offset(24)
      make.bottom.equalToSuperview().offset(-24)
      make.width.equalTo(80)
      make.height.equalTo(54)
    }
    
    self.typeLabel.snp.makeConstraints { make in
      make.left.equalTo(self.modeImage.snp.right).offset(26)
      make.top.equalTo(self.modeImage).offset(8)
    }
    
    self.containerView.snp.makeConstraints { make in
      make.left.equalTo(self.typeLabel).offset(-10)
      make.top.equalTo(self.typeLabel).offset(-4)
      make.right.equalTo(self.typeLabel).offset(10)
      make.bottom.equalTo(self.typeLabel).offset(4)
    }
    
    self.nameLabel.snp.makeConstraints { make in
      make.left.equalTo(self.containerView)
      make.top.equalTo(self.containerView.snp.bottom).offset(12)
      make.right.equalToSuperview().offset(-24)
    }
  }
  
  func bind(mode: Mode) {
    self.modeImage.setImage(urlString: mode.image)
    self.typeLabel.text = mode.players
    self.nameLabel.text = mode.name
  }
}
