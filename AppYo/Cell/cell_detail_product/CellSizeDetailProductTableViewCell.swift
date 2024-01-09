//
//  CellSizeDetailProductTableViewCell.swift
//  AppYo
//
//  Created by QRVN on 05/01/2024.
//

import UIKit

class CellSizeDetailProductTableViewCell: UITableViewCell {

    @IBOutlet weak var heightViewChonSize: NSLayoutConstraint!
    @IBOutlet weak var viewSize: UIView!
    @IBOutlet weak var button: UIButton!
    
    var onClickChonSizeClosure: ((Bool) -> ())?
    var isClick: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        button.setBorder()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        //super.setSelected(selected, animated: animated)
    }
    
    func bindData(isClick: Bool) {
        self.isClick = isClick
        
        if isClick {
            heightViewChonSize.constant = 220
            viewSize.isHidden = false
        } else {
            heightViewChonSize.constant = 0
            viewSize.isHidden = true
        }
    }
    
    @IBAction func actionChonSize(_ sender: UIButton) {
        onClickChonSizeClosure?(isClick)
    }
    
}
