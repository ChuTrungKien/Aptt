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
    @IBOutlet weak var collectionViewColor: UICollectionView!
    @IBOutlet weak var collectionViewSize: UICollectionView!
    @IBOutlet weak var labelChieuCao: UILabel!
    @IBOutlet weak var labelCanNang: UILabel!
    @IBOutlet weak var sizeShopChon: UILabel!
    @IBOutlet weak var soLuongSP: UILabel!
    
    var onClickChonSizeClosure: ((Bool) -> ())?
    var isClick: Bool = false
    var listSizeNeeds: [ObjSize] = []
    var soLuong: Int = 0
    
    let listColor: [ObjColor] = Utility.getListColor()
    let listSize: [ObjSize] = Utility.getListSize()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        button.setBorder()
        
        collectionViewColor.dataSource = self
        collectionViewColor.delegate = self
        collectionViewSize.dataSource = self
        collectionViewSize.delegate = self
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
    
    @IBAction func actionThemVaoGioHang(_ sender: UIButton) {
    }
    
    @IBAction func actionBoSP(_ sender: UIButton) {
        if(soLuong == 0) {
            return
        } else {
            soLuong = soLuong - 1
        }
    }
    
    @IBAction func actionThemSP(_ sender: UIButton) {
        soLuong = soLuong + 1
    }
}

extension CellSizeDetailProductTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == self.collectionViewSize) {
            return 1
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == self.collectionViewSize) {
            return UICollectionViewCell()
        } else {
            return UICollectionViewCell()
        }
    }
}
