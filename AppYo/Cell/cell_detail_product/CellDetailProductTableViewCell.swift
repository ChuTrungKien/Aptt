//
//  CellDetailProductTableViewCell.swift
//  AppYo
//
//  Created by QRVN on 04/01/2024.
//

import UIKit

class CellDetailProductTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgView.image = UIImage(named: "item_Ao")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        //super.setSelected(selected, animated: animated)
    }
    
}
