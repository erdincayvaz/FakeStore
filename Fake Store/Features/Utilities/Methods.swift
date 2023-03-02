//
//  Methods.swift
//  Fake Store
//
//  Created by Sampas Bilisim on 1.03.2023.
//

import Foundation
import UIKit

class Methods {
    
    static func StartActivity(view:UIViewController, viewController:UIViewController, isNavigation:Bool) -> Void {
        let navController = UINavigationController(rootViewController: viewController)
        if isNavigation {
            navController.modalPresentationStyle = .fullScreen
        }
        navController.navigationItem.backButtonTitle = ""
        viewController.navigationItem.backButtonTitle = ""
        if isNavigation {
            //view.navigationController?.show(viewController, sender: nil)
            view.present(navController, animated: true, completion: nil)
        }else{
            view.present(navController, animated: true, completion: nil)
        }
    }
}
