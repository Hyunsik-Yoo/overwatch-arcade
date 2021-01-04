import UIKit
import SnapKit

class MainView: BaseView {
  
  let backgroundImage = UIImageView().then {
    $0.image = UIImage(named: "img_background")
    $0.contentMode = .scaleAspectFill
  }
  
  let historyButton = UIButton().then {
    $0.setImage(UIImage(named: "ic_history"), for: .normal)
  }
  
  let scrollView = UIScrollView().then {
    $0.showsVerticalScrollIndicator = false
  }
  
  let containerView = UIView()
  
  let mayhemImage = UIImageView().then {
    $0.image = UIImage(named: "img_mayhem")
  }
  
  
  override func setup() {
    addSubViews(backgroundImage, historyButton, mayhemImage)
  }
  
  override func bindConstraints() {
    self.backgroundImage.snp.makeConstraints { make in
      make.edges.equalTo(0)
    }
    
    self.historyButton.snp.makeConstraints { make in
      make.right.equalToSuperview().offset(-24)
      make.top.equalTo(safeAreaLayoutGuide).offset(24)
      make.width.height.equalTo(24)
    }
    
    self.mayhemImage.snp.makeConstraints { make in
      make.left.equalToSuperview().offset(24)
      make.top.equalTo(self.historyButton.snp.bottom).offset(63)
      make.width.height.equalTo(108 * RatioUtils.widthRatio)
    }
  }
}
