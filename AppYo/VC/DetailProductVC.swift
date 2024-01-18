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
    var listColor: [ObjColors] = []
    var objColorSizes: [ObjColorSize] = []
    
    init(obj: ObjItemClother) {
        super.init(nibName: DetailProductVC.className, bundle: nil)
        self.obj = obj
        listSize = Utility.returnListSize(sizes: obj.size, list: Utility.getListSize())
        listColor = obj.colors
        for item in listColor {
            objColorSizes.append(ObjColorSize(color: item.returnColor(), listSize: Utility.returnListSize(sizes: item.sizeHet, list: Utility.getListSize())))
        }
        objColorSizes.first?.color.isChon = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
            cell.onClickColorClosure = { [weak self] (colorSize, index) in
                guard let self = self else { return }
                self.objColorSizes[index].color = colorSize
                self.tableView.reloadData()
            }
            cell.bindData(lColorSize: objColorSizes, obj: obj)
            return cell
        case .SizeSP:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellSizeDetailProductTableViewCell.className, for: indexPath) as? CellSizeDetailProductTableViewCell else { return UITableViewCell() }
            cell.onClickChonSizeClosure = { [weak self] isClick in
                guard let self = self else { return }
                self.isClick = !isClick
                self.tableView.reloadData()
            }
            cell.bindData(isClick: isClick, lSize: listSize)
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

