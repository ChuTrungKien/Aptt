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
