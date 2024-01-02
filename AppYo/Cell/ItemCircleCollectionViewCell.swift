//
//  ItemCircleCollectionViewCell.swift
//  AppPt
//
//  Created by QRVN on 19/12/2023.
//

import UIKit

class ItemCircleCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageCircle: UIImageView!
    var onClickClosure: (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imageCircle.addGestureRecognizer(tapGesture)
    }

    func bindData(name: String, size: Int) {
        imageCircle.layer.masksToBounds = true
        imageCircle.layer.cornerRadius = CGFloat(size/2)
        imageCircle.layer.borderWidth = 1
        imageCircle.layer.borderColor = UIColor.systemYellow.cgColor
        imageCircle.image = UIImage(named: name)
    }
    
    @objc func imageTapped() {
        onClickClosure?()
    }
}
