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
  
  let dateLabel = UILabel().then {
    $0.text = "2020. 09.30"
    $0.font = UIFont(name: "koverwatch", size: 20)
    $0.textColor = .white
  }
  
  let titleLabel = UILabel().then {
    $0.numberOfLines = 0
    $0.text = "오늘은 난장판이 아닙니다..\n다음기회에.."
    $0.textColor = .white
    $0.font = UIFont(name: "koverwatch", size: 36)
  }
  
  
  override func setup() {
    containerView.addSubViews(mayhemImage, dateLabel, titleLabel)
    scrollView.addSubview(containerView)
    addSubViews(backgroundImage, historyButton, scrollView)
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
    
    self.scrollView.snp.makeConstraints { make in
      make.left.right.bottom.equalToSuperview()
      make.top.equalTo(self.historyButton.snp.bottom).offset(10)
    }
    
    self.containerView.snp.makeConstraints { make in
      make.edges.equalTo(self.scrollView)
      make.width.equalTo(UIScreen.main.bounds.width)
      make.top.equalToSuperview()
      make.bottom.equalTo(titleLabel.snp.bottom)
    }
    
    self.mayhemImage.snp.makeConstraints { make in
      make.left.equalToSuperview().offset(24)
      make.top.equalTo(self.historyButton.snp.bottom).offset(63)
      make.width.height.equalTo(108 * RatioUtils.widthRatio)
    }
    
    self.dateLabel.snp.makeConstraints { make in
      make.left.equalToSuperview().offset(24)
      make.top.equalTo(self.mayhemImage.snp.bottom).offset(17)
    }
    
    self.titleLabel.snp.makeConstraints { make in
      make.left.equalToSuperview().offset(24)
      make.top.equalTo(self.dateLabel.snp.bottom).offset(16)
    }
  }
}
