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
    @IBOutlet weak var collectionViewSize: UICollectionView!
    @IBOutlet weak var labelChieuCao: UILabel!
    @IBOutlet weak var labelCanNang: UILabel!
    @IBOutlet weak var sizeShopChon: UILabel!
    @IBOutlet weak var soLuongSP: UILabel!
    
    var onClickChonSizeClosure: ((Bool) -> ())?
    var isClick: Bool = false
    var listSizeNeeds: [ObjSize] = []
    var soLuong: Int = 0
    
    var listSize: [ObjSize] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        soLuongSP.text = "\(soLuong)"
        button.setBorder()
        collectionViewSize.dataSource = self
        collectionViewSize.delegate = self
        collectionViewSize.register(UINib(nibName: "CellSizeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CellSizeCollectionViewCell")
        setUpItem()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        //super.setSelected(selected, animated: animated)
    }
    
    func bindData(isClick: Bool, lSize: [ObjSize]) {
        self.isClick = isClick
        self.listSize = lSize
        self.collectionViewSize.reloadData()
        
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
            soLuongSP.text = "\(soLuong)"
            return
        } else {
            soLuong = soLuong - 1
            soLuongSP.text = "\(soLuong)"
        }
    }
    
    @IBAction func actionThemSP(_ sender: UIButton) {
        soLuong = soLuong + 1
        soLuongSP.text = "\(soLuong)"
    }
}

extension CellSizeDetailProductTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listSize.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellSizeCollectionViewCell", for: indexPath) as? CellSizeCollectionViewCell else { return UICollectionViewCell()}
        cell.bindData(lb: listSize[indexPath.row].size)
        return cell
    }
    
    func setUpItem() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 40, height: 40)
        collectionViewSize.setCollectionViewLayout(layout, animated: true)
    }
}
