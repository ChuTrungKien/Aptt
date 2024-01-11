//
//  DetailProductVC.swift
//  AppYo
//
//  Created by QRVN on 04/01/2024.
//

import UIKit

class DetailProductVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let listType: [TypeDetailProduct] = [.ImageSP, .SizeSP]
    var isClick: Bool = false
    var obj: ObjItemClother = ObjItemClother()
    var listSize: [ObjSize] = []
    var colorInit: ObjColor = ObjColor()
    
//    init(obj: ObjItemClother) {
//        super.init(nibName: DetailProductVC.className, bundle: nil)
//        self.obj = obj
//        listSize = Utility.returnListSize(sizes: obj.size, list: Utility.getListSize())
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chi Tiet SP"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerCells(cells: [CellDetailProductTableViewCell.className, CellSizeDetailProductTableViewCell.className])
    }
}

extension DetailProductVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type: TypeDetailProduct = listType[indexPath.row]
        switch type {
        case .ImageSP:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellDetailProductTableViewCell.className, for: indexPath) as? CellDetailProductTableViewCell else { return UITableViewCell() }
            return cell
        case .SizeSP:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellSizeDetailProductTableViewCell.className, for: indexPath) as? CellSizeDetailProductTableViewCell else { return UITableViewCell() }
            cell.onClickChonSizeClosure = { [weak self] isClick in
                guard let self = self else { return }
                self.isClick = !isClick
                self.tableView.reloadData()
            }
            cell.bindData(isClick: isClick)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

enum TypeDetailProduct {
    case ImageSP
    case SizeSP
    case Adress
    case Transport
}
