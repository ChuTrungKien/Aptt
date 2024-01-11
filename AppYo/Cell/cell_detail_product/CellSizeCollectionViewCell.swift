//
//  CellSizeCollectionViewCell.swift
//  AppYo
//
//  Created by QRVN on 11/01/2024.
//

import UIKit

class CellSizeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var sizeLb: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func bindData(lb: String) {
        sizeLb.text = lb
    }
}
