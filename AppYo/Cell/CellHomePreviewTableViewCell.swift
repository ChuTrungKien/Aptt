//
//  CellHomePreviewTableViewCell.swift
//  AppPt
//
//  Created by QRVN on 20/12/2023.
//

import UIKit

class CellHomePreviewTableViewCell: UITableViewCell {

    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var btnXemThem: UIButton!
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tiLe: NSLayoutConstraint!
    
    var listCollection: [ObjItemClother] = []
    var onClickXemThemClosure: (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tiLe.constant = SCREEN_WIDTH/(152 + (4*SCREEN_WIDTH)/9)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ItemClotherCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ItemClotherCollectionViewCell")
        setupItemCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        //super.setSelected(selected, animated: animated)
    }
    
    @IBAction func xemThemAction(_ sender: UIButton) {
        onClickXemThemClosure?()
    }
    
    func bindData(obj_1: ObjMotBST, obj_2: ObjMotItemClother) {
        titleView.text = obj_1.nameBST
        imageV.image = UIImage(named: obj_1.banner)
        self.listCollection = obj_2.collection
    }
}

extension CellHomePreviewTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemClotherCollectionViewCell", for: indexPath) as? ItemClotherCollectionViewCell
        else { return UICollectionViewCell() }
        cell.bindData(obj: listCollection[indexPath.row])
        return cell
    }
    
    func setupItemCell() {
        let layoutItem: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layoutItem.minimumLineSpacing = 4
        layoutItem.minimumInteritemSpacing = 0
        layoutItem.itemSize = CGSize(width: SCREEN_WIDTH/3, height: (152 + (4*SCREEN_WIDTH)/9))
        layoutItem.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layoutItem, animated: true)
    }
}
