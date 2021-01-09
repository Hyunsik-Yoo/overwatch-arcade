import UIKit
import SnapKit
import Kingfisher

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
    $0.isSkeletonable = true
  }
  
  let containerView = UIView().then {
    $0.isSkeletonable = true
  }
  
  let mayhemImage = UIImageView().then {
    $0.image = UIImage(named: "img_mayhem")
  }
  
  let dateLabel = UILabel().then {
    $0.isSkeletonable = true
    $0.linesCornerRadius = 3
    $0.font = UIFont(name: "koverwatch", size: 20)
    $0.textColor = .white
  }
  
  let titleLabel = UILabel().then {
    $0.isSkeletonable = true
    $0.linesCornerRadius = 3
    $0.lastLineFillPercent = 50
    $0.numberOfLines = 2
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
    $0.isSkeletonable = true
    $0.linesCornerRadius = 3
  }
  
  let ratioDescLabel = UILabel().then {
    $0.textColor = UIColor(r: 108, g: 108, b: 108)
    $0.font = UIFont(name: "koverwatch", size: 12)
    $0.text = "main_ratio_desc".localized
    $0.isSkeletonable = true
    $0.linesCornerRadius = 3
  }
  
  let ratioValueLabel = UILabel().then {
    $0.isSkeletonable = true
    $0.linesCornerRadius = 3
    $0.textColor = .white
    $0.font = UIFont(name: "koverwatch", size: 36)
  }
  
  let todayLabel = UILabel().then {
    $0.textColor = .white
    $0.font = UIFont(name: "koverwatch", size: 20)
    $0.text = "main_overwatch_arcade_today".localized
    $0.isSkeletonable = true
    $0.linesCornerRadius = 3
  }
  
  let remainTimeLabel = UILabel().then {
    $0.textColor = .white
    $0.font = UIFont(name: "koverwatch", size: 20)
    $0.isSkeletonable = true
    $0.linesCornerRadius = 3
  }
  
  let arcadeImage1 = UIImageView().then {
    $0.layer.cornerRadius = 6
    $0.layer.masksToBounds = true
    $0.contentMode = .top
    $0.backgroundColor = .gray
    $0.isSkeletonable = true
  }
  
  let arcadeTypeContainer = UIView().then {
    $0.layer.cornerRadius = 10
    $0.layer.masksToBounds = true
    $0.backgroundColor = UIColor(r: 249, g: 95, b: 95)
  }
  
  let arcadeTypeLabel1 = UILabel().then {
    $0.textColor = .white
    $0.font = UIFont(name: "koverwatch", size: 12)
    $0.text = "3 v 3"
  }
  
  let arcadeLabel1 = UILabel().then {
    $0.isSkeletonable = true
    $0.linesCornerRadius = 3
    $0.textColor = .white
    $0.font = UIFont(name: "koverwatch", size: 20)
  }
  
  let modeView2 = ModeView()
  
  let modeView3 = ModeView()
  
  let modeView4 = ModeView()
  
  let modeView5 = ModeView()
  
  let modeView6 = ModeView()
  
  let modeView7 = ModeView()
  
  
  override func setup() {
    self.isSkeletonable = true
    containerView.addSubViews(
      mayhemImage, dateLabel, titleLabel, ratioContainerView,
      ratioTitleLabel, ratioDescLabel, ratioValueLabel, todayLabel,
      remainTimeLabel, arcadeImage1, arcadeTypeContainer, arcadeTypeLabel1,
      arcadeLabel1, modeView2, modeView3, modeView4,
      modeView5, modeView6, modeView7
    )
    scrollView.addSubview(containerView)
    addSubViews(backgroundImage, historyButton, scrollView)
    self.showSkeleton(usingColor: .gray, transition: .crossDissolve(0.3))
    self.showAnimatedGradientSkeleton()
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
    
    self.mayhemImage.snp.makeConstraints { make in
      make.left.equalToSuperview().offset(24)
      make.top.equalToSuperview().offset(80)
      make.width.height.equalTo(108 * RatioUtils.widthRatio)
    }
    
    self.dateLabel.snp.makeConstraints { make in
      make.left.equalToSuperview().offset(24)
      make.top.equalTo(self.mayhemImage.snp.bottom).offset(17)
    }
    
    self.titleLabel.snp.makeConstraints { make in
      make.left.equalToSuperview().offset(24)
      make.right.equalToSuperview().offset(-24)
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
      make.left.equalTo(self.arcadeImage1).offset(14)
      make.centerY.equalTo(self.arcadeImage1.snp.bottom)
    }
    
    self.arcadeLabel1.snp.makeConstraints { make in
      make.left.equalToSuperview().offset(28)
      make.right.equalToSuperview().offset(-28)
      make.top.equalTo(self.arcadeImage1.snp.bottom).offset(18)
    }
    
    self.modeView2.snp.makeConstraints { make in
      make.left.equalToSuperview().offset(24)
      make.right.equalTo(self.snp.centerX).offset(-7.5)
      make.top.equalTo(self.arcadeLabel1.snp.bottom).offset(24)
    }
    
    self.modeView3.snp.makeConstraints { make in
      make.right.equalToSuperview().offset(-24)
      make.left.equalTo(self.snp.centerX).offset(7.5)
      make.top.bottom.equalTo(self.modeView2)
    }

    self.modeView4.snp.makeConstraints { make in
      make.left.right.equalTo(self.modeView2)
      make.top.equalTo(self.modeView2.snp.bottom).offset(24)
    }

    self.modeView5.snp.makeConstraints { make in
      make.left.right.equalTo(self.modeView3)
      make.top.bottom.equalTo(self.modeView4)
    }

    self.modeView6.snp.makeConstraints { make in
      make.left.right.equalTo(self.modeView4)
      make.top.equalTo(self.modeView4.snp.bottom).offset(24)
    }

    self.modeView7.snp.makeConstraints { make in
      make.left.right.equalTo(self.modeView5)
      make.top.bottom.equalTo(self.modeView6)
    }
    
    self.containerView.snp.makeConstraints { make in
      make.edges.equalTo(self.scrollView)
      make.width.equalTo(UIScreen.main.bounds.width)
      make.top.equalToSuperview()
      make.bottom.equalTo(self.modeView7).offset(24)
    }
    
    self.arcadeTypeContainer.snp.makeConstraints { make in
      make.left.equalTo(self.arcadeTypeLabel1).offset(-10)
      make.top.equalTo(self.arcadeTypeLabel1).offset(-4)
      make.bottom.equalTo(self.arcadeTypeLabel1).offset(4)
      make.right.equalTo(self.arcadeTypeLabel1).offset(10)
    }
  }
  
  func setMayhem(isMayhemToday: Bool) {
    if isMayhemToday {
      self.mayhemImage.alpha = 1.0
      self.setMayhemTodayTitle()
      self.startOpacityAnimation()
    } else {
      self.mayhemImage.alpha = 0.5
      self.setMayhemNotTodayTitle()
    }
  }
  
  func bindArcade(arcade: Arcade) {
    self.setImage(url: arcade.modes.tile_1.image)
    self.arcadeTypeLabel1.text = arcade.modes.tile_1.players
    self.arcadeLabel1.text = arcade.modes.tile_1.name
    
    self.modeView2.bind(mode: arcade.modes.tile_2)
    self.modeView3.bind(mode: arcade.modes.tile_3)
    self.modeView4.bind(mode: arcade.modes.tile_4)
    self.modeView5.bind(mode: arcade.modes.tile_5)
    self.modeView6.bind(mode: arcade.modes.tile_6)
    self.modeView7.bind(mode: arcade.modes.tile_7)
    self.hideSkeleton()
  }
  
  private func setMayhemTodayTitle() {
    let attributedText = NSMutableAttributedString(string: "main_title_is_mayhem".localized)
    let range = attributedText.mutableString.range(of: "난장판", options: .caseInsensitive)
    let paragraphStyle = NSMutableParagraphStyle()
    
    paragraphStyle.lineSpacing = 10
    paragraphStyle.lineBreakMode = .byTruncatingTail
    
    if range.location != NSNotFound {
      attributedText.addAttribute(.foregroundColor, value: UIColor.yellow, range: range)
      attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.length))
    }
    self.titleLabel.attributedText = attributedText
  }
  
  private func setMayhemNotTodayTitle() {
    let attributedText = NSMutableAttributedString(string: "main_title_is_not_mayhem".localized)
    let paragraphStyle = NSMutableParagraphStyle()
    
    paragraphStyle.lineSpacing = 10
    paragraphStyle.lineBreakMode = .byTruncatingTail
    
    attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.length))
    self.titleLabel.attributedText = attributedText
  }
  
  private func startOpacityAnimation() {
    UIView.animate(withDuration: 1, delay: 0, options: [.autoreverse, .repeat]) {
      self.mayhemImage.alpha = 0
    } completion: { _ in }
  }
  
  private func setImage(url: String) {
    guard let url = URL(string: url) else { return }
    KingfisherManager.shared.retrieveImage(with: url) { result in
      switch result {
      case .success(let imageResult):
        let newSize = self.resizeImageByWidth(image: imageResult.image, newWidth: UIScreen.main.bounds.width - 48)
        
        self.arcadeImage1.image = imageResult.image.resize(targetSize: newSize)
      case .failure( _):
        break
      }
    }
  }
  
  private func resizeImageByWidth(image: UIImage, newWidth: CGFloat) -> CGSize {
    let scale = newWidth / image.size.width
    let newHeight = image.size.height * scale
    
    return CGSize(width: newWidth, height: newHeight)
  }
}
