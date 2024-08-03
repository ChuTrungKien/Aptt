//
//  IntroVC.swift
//  AppYo
//
//  Created by QRVN on 03/08/2024.
//

import UIKit

class IntroVC: UIViewController {

    @IBOutlet weak var gotoHomeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gotoHomeBtn.setBorder()
    }
    
    @IBAction func gotoHome(_ sender: UIButton) {}
}
