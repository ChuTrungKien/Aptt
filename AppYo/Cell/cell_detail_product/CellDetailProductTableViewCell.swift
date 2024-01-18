//
//  CellDetailProductTableViewCell.swift
//  AppYo
//
//  Created by QRVN on 04/01/2024.
//

import UIKit

class CellDetailProductTableViewCell: UITableViewCell {

    @IBOutlet weak var nameColor: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var collectionViewColor: UICollectionView!
    @IBOutlet weak var nameSP: UILabel!
    
    var obj: ObjItemClother = ObjItemClother()
    var listColor: [ObjColorSize] = []
    var onClickColorClosure: ((ObjColor, Int) -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgView.image = UIImage(named: "item_Ao")
        collectionViewColor.dataSource = self
        collectionViewColor.delegate = self
        collectionViewColor.register(UINib(nibName: "ItemCircleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ItemCircleCollectionViewCell")
        setupItem()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        //super.setSelected(selected, animated: animated)
    }
    
    func bindData(lColorSize: [ObjColorSize], obj: ObjItemClother) {
        self.listColor = lColorSize
        nameSP.text = obj.nameSP
        for item in lColorSize {
            if (item.color.isChon) {
                nameColor.text = item.color.color
            }
        }
        self.collectionViewColor.reloadData()
    }
}

extension CellDetailProductTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listColor.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCircleCollectionViewCell", for: indexPath) as? ItemCircleCollectionViewCell else { return UICollectionViewCell()}
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let colSize: ObjColorSize = listColor[indexPath.row]
        colSize.color.isChon = true
        for i in 0..<(listColor.count) {
            if (i != indexPath.row) {
                listColor[i].color.isChon = false
            }
        }
        onClickColorClosure?(colSize.color, indexPath.row)
    }
    
    func setupItem() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 40, height: 40)
        collectionViewColor.setCollectionViewLayout(layout, animated: true)
    }
}
