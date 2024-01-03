//
//  HomeVC.swift
//  AppPt
//
//  Created by QRVN on 20/12/2023.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let listBST: [ObjMotBST] = Utility.getListBoST()
    let listItemClother: [ObjMotItemClother] = Utility.getListBoItemClother()
    
    var obj: ObjMotItemClother = ObjMotItemClother()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CellHomePreviewTableViewCell", bundle: nil), forCellReuseIdentifier: "CellHomePreviewTableViewCell")
    }
}

extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listBST.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellHomePreviewTableViewCell", for: indexPath) as? CellHomePreviewTableViewCell
            else { return UITableViewCell() }
        let item = listBST[indexPath.row]
        for it in listItemClother {
            if (item.idList.first == it.id) {
                self.obj = it
            }
        }
        cell.bindData(obj_1: item, obj_2: obj)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (210 + (SCREEN_WIDTH*17)/18)
    }
}
