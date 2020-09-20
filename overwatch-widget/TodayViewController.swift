//
//  TodayViewController.swift
//  overwatch-widget
//
//  Created by Hyunsik Yoo on 2020/09/04.
//  Copyright © 2020 Macgongmon. All rights reserved.
//

import UIKit
import NotificationCenter
import Alamofire
import Kingfisher

class TodayViewController: UIViewController, NCWidgetProviding {
  
  @IBOutlet weak var tile1: UIImageView!
  @IBOutlet weak var tile2: UIImageView!
  @IBOutlet weak var tile3: UIImageView!
  @IBOutlet weak var tile4: UIImageView!
  @IBOutlet weak var tile5: UIImageView!
  @IBOutlet weak var tile6: UIImageView!
  @IBOutlet weak var tile7: UIImageView!
  
  @IBOutlet weak var tile1Title: UILabel!
  @IBOutlet weak var tile2Title: UILabel!
  @IBOutlet weak var tile3Title: UILabel!
  @IBOutlet weak var tile4Title: UILabel!
  @IBOutlet weak var tile5Title: UILabel!
  @IBOutlet weak var tile6Title: UILabel!
  @IBOutlet weak var tile7Title: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    extensionContext?.widgetLargestAvailableDisplayMode = .expanded
    // Register the table view cell.
    self.getArcadeInfo()
  }
  
  func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResult.Failed
    // If there's no update required, use NCUpdateResult.NoData
    // If there's an update, use NCUpdateResult.NewData
    
    completionHandler(NCUpdateResult.newData)
  }
  
  private func getArcadeInfo() {
    let urlString = "https://overwatcharcade.today/api/overwatch/today"
    
    Alamofire.request(urlString, method: .get).responseJSON { response in
      if let value = response.value {
        let arcades: Arcade = JsonUtils.toJson(object: value)!
        
        
        self.tile1.kf.setImage(with: URL(string: arcades.modes.tile_1.image)!)
        self.tile2.kf.setImage(with: URL(string: arcades.modes.tile_2.image)!)
        self.tile3.kf.setImage(with: URL(string: arcades.modes.tile_3.image)!)
        self.tile4.kf.setImage(with: URL(string: arcades.modes.tile_4.image)!)
        self.tile5.kf.setImage(with: URL(string: arcades.modes.tile_5.image)!)
        self.tile6.kf.setImage(with: URL(string: arcades.modes.tile_6.image)!)
        self.tile7.kf.setImage(with: URL(string: arcades.modes.tile_7.image)!)
        
        self.tile1Title.text = arcades.modes.tile_1.name
        self.tile2Title.text = arcades.modes.tile_2.name
        self.tile3Title.text = arcades.modes.tile_3.name
        self.tile4Title.text = arcades.modes.tile_4.name
        self.tile5Title.text = arcades.modes.tile_5.name
        self.tile6Title.text = arcades.modes.tile_6.name
        self.tile7Title.text = arcades.modes.tile_7.name
      }
    }
  }
  
}
