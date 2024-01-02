//
//  ItemClotherCollectionViewCell.swift
//  AppPt
//
//  Created by QRVN on 19/12/2023.
//

import UIKit

class ItemClotherCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameProduct: UILabel!
    @IBOutlet weak var giaKM: UILabel!
    @IBOutlet weak var giaGoc: UILabel!
    
    var onClickImgClosure: (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "ItemCircleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ItemCircleCollectionViewCell")
        setupItemCell()
        setupView()
    }

    func bindData(obj: ObjItemClother) {
        imageView.image = UIImage(named: obj.imgStr)
        giaGoc.text = "\(obj.price)"
        if (obj.sale > 0) {
            giaKM.isHidden = false
            giaGoc.textColor = .darkGray
            let giaSauSale: Int = obj.price - obj.price*(obj.sale)/100
            giaKM.text = "\(giaSauSale)"
        }
    }
}

extension ItemClotherCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCircleCollectionViewCell", for: indexPath) as? ItemCircleCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        cell.bindData(name: "ao_circle", size: 40)
        cell.onClickClosure = { [weak self] in
            guard let self = self else { return }
        }
        return cell
    }
    
    func setupItemCell() {
        var layoutItem: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layoutItem.minimumLineSpacing = 0
        layoutItem.minimumInteritemSpacing = 0
        layoutItem.itemSize = CGSize(width: 40, height: 40)
        layoutItem.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layoutItem, animated: true)
    }
    
    func setupView() {
        giaKM.isHidden = true
        giaGoc.textColor = .black
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(TapImaged))
        imageView.addGestureRecognizer(tapGesture)
    }
    
    @objc func TapImaged() {
        onClickImgClosure?()
    }
}
