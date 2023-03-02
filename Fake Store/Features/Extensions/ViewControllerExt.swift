//
//  ViewControllerExt.swift
//  Fake Store
//
//  Created by Sampas Bilisim on 1.03.2023.
//

import Foundation
import UIKit
import MBProgressHUD

extension UIViewController {
    
    //Tüm ViewController'da Progress Dialog oluşturabilmek için eklenen özellik
    func showHud(_ message: String) {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.mode = MBProgressHUDMode.indeterminate
        hud.label.text = message
        hud.isUserInteractionEnabled = false
    }
    
    func hideHUD() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}
