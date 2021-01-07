import UIKit

class ModeView: BaseView {
  
  let modeImage = UIImageView().then {
    $0.backgroundColor = .red
    $0.layer.cornerRadius = 6
    $0.layer.masksToBounds = true
  }
  
  let typeContainerView = UIView().then {
    $0.layer.cornerRadius = 34
    $0.layer.masksToBounds = true
    $0.backgroundColor = UIColor(r: 249, g: 95, b: 95)
  }
  
  let typeLabel = UILabel().then {
    $0.textColor = .white
    $0.font = UIFont(name: "koverwatch", size: 12)
    $0.text = "3 v 3"
  }
  
  let nameLabel = UILabel().then {
    $0.textColor = .white
    $0.font = UIFont(name: "koverwatch", size: 20)
    $0.text = "섬멸전 경쟁전"
  }
  
  override func setup() {
    backgroundColor = .clear
    addSubViews(modeImage, typeContainerView, typeLabel, nameLabel)
  }
  
  override func bindConstraints() {
    self.modeImage.snp.makeConstraints { make in
      make.left.top.right.equalToSuperview()
      make.height.equalTo(104)
    }
    
    self.typeLabel.snp.makeConstraints { make in
      make.left.equalTo(self.modeImage).offset(14)
      make.centerY.equalTo(self.modeImage.snp.bottom)
    }
    
    self.nameLabel.snp.makeConstraints { make in
      make.left.equalTo(self.modeImage).offset(4)
      make.right.equalTo(self.modeImage)
      make.top.equalTo(self.typeLabel.snp.bottom).offset(12)
    }
    
    self.snp.makeConstraints { make in
      make.left.right.top.equalTo(self.modeImage)
      make.bottom.equalTo(self.nameLabel)
    }
  }
  
  func bind(mode: Mode) {
    self.modeImage.setImage(urlString: mode.image)
    self.typeLabel.text = mode.players
    self.nameLabel.text = mode.name
    
    self.typeContainerView.snp.makeConstraints { make in
      make.left.equalTo(self.typeLabel).offset(-10)
      make.top.equalTo(self.typeLabel).offset(-4)
      make.bottom.equalTo(self.typeLabel).offset(4)
      make.right.equalTo(self.typeLabel).offset(10)
    }
  }
}
