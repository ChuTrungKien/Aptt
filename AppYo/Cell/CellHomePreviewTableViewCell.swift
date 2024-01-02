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
    
    var listCollection: [ObjItemClother] = []
    var onClickXemThemClosure: (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
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
        var layoutItem: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layoutItem.minimumLineSpacing = 0
        layoutItem.minimumInteritemSpacing = 0
        layoutItem.itemSize = CGSize(width: 90, height: 160)
        layoutItem.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layoutItem, animated: true)
    }
}
