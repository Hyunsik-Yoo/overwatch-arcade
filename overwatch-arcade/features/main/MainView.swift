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
    $0.text = "main_title_is_not_mayhem".localized
    $0.textColor = .white
    $0.font = UIFont(name: "koverwatch", size: 36)
  }
  
  let ratioContainerView = UIView().then {
    $0.backgroundColor = UIColor(r: 28, g: 30, b: 31)
    $0.layer.cornerRadius = 8
    $0.layer.masksToBounds = true
  }
  
  let ratioTitleLabel = UILabel().then {
    $0.textColor = UIColor(r: 218, g: 218, b: 218)
    $0.font = UIFont(name: "koverwatch", size: 16)
    $0.text = "main_ratio_title".localized
  }
  
  let ratioDescLabel = UILabel().then {
    $0.textColor = UIColor(r: 108, g: 108, b: 108)
    $0.font = UIFont(name: "koverwatch", size: 12)
    $0.text = "main_ratio_desc".localized
  }
  
  let ratioValueLabel = UILabel().then {
    $0.textColor = .white
    $0.font = UIFont(name: "koverwatch", size: 36)
    $0.text = "60%"
  }
  
  let todayLabel = UILabel().then {
    $0.textColor = .white
    $0.font = UIFont(name: "koverwatch", size: 20)
    $0.text = "main_overwatch_arcade_today".localized
  }
  
  let remainTimeLabel = UILabel().then {
    $0.textColor = .white
    $0.font = UIFont(name: "koverwatch", size: 20)
    $0.text = " 18:42:21"
  }
  
  let arcadeImage1 = UIImageView().then {
    $0.layer.cornerRadius = 6
    $0.layer.masksToBounds = true
    $0.backgroundColor = .red
  }
  
  let arcadeTypeLabel1 = UILabel().then {
    $0.textColor = .white
    $0.font = UIFont(name: "koverwatch", size: 12)
    $0.backgroundColor = UIColor(r: 249, g: 95, b: 95)
    $0.layer.cornerRadius = 34
    $0.layer.masksToBounds = true
    $0.text = "3 v 3"
  }
  
  let arcadeLabel1 = UILabel().then {
    $0.textColor = .white
    $0.font = UIFont(name: "koverwatch", size: 20)
    $0.text = "섬멸전 경쟁전"
  }
  
  let arcadeImage2 = UIImageView().then {
    $0.layer.cornerRadius = 6
    $0.layer.masksToBounds = true
    $0.backgroundColor = .red
  }
  
  
  override func setup() {
    containerView.addSubViews(
      mayhemImage, dateLabel, titleLabel, ratioContainerView,
      ratioTitleLabel, ratioDescLabel, ratioValueLabel, todayLabel,
      remainTimeLabel, arcadeImage1, arcadeTypeLabel1, arcadeLabel1
    )
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
    
    self.ratioContainerView.snp.makeConstraints { make in
      make.left.equalToSuperview().offset(24)
      make.right.equalToSuperview().offset(-24)
      make.top.equalTo(self.titleLabel.snp.bottom).offset(24)
      make.bottom.equalTo(self.ratioDescLabel).offset(16)
    }
    
    self.ratioTitleLabel.snp.makeConstraints { make in
      make.left.equalTo(self.ratioContainerView).offset(12)
      make.top.equalTo(self.ratioContainerView).offset(16)
    }
    
    self.ratioDescLabel.snp.makeConstraints { make in
      make.left.equalTo(self.ratioTitleLabel)
      make.top.equalTo(self.ratioTitleLabel.snp.bottom).offset(8)
    }
    
    self.ratioValueLabel.snp.makeConstraints { make in
      make.centerY.equalTo(self.ratioContainerView)
      make.right.equalTo(self.ratioContainerView).offset(-12)
    }
    
    self.todayLabel.snp.makeConstraints { make in
      make.left.equalToSuperview().offset(24)
      make.top.equalTo(self.ratioContainerView.snp.bottom).offset(72)
    }
    
    self.remainTimeLabel.snp.makeConstraints { make in
      make.right.equalToSuperview().offset(-24)
      make.centerY.equalTo(self.todayLabel)
    }
    
    self.arcadeImage1.snp.makeConstraints { make in
      make.left.equalToSuperview().offset(24)
      make.right.equalToSuperview().offset(-24)
      make.top.equalTo(self.todayLabel.snp.bottom).offset(8)
      make.height.equalTo(176)
    }
    
    self.arcadeTypeLabel1.snp.makeConstraints { make in
      make.left.equalTo(self.arcadeImage1).offset(4)
      make.centerY.equalTo(self.arcadeImage1.snp.bottom)
    }
    
    self.arcadeLabel1.snp.makeConstraints { make in
      make.left.equalToSuperview().offset(28)
      make.right.equalToSuperview().offset(-28)
      make.top.equalTo(self.arcadeImage1.snp.bottom).offset(18)
    }
  }
}
