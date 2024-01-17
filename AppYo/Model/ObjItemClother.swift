//
//  ObjItemClother.swift
//  AppPt
//
//  Created by QRVN on 20/12/2023.
//

import Foundation
import ObjectMapper

class ObjItemClother: Mappable {
    var id: Int = 0
    var imgStr: String = ""
    var nameSP: String = ""
    var price: Int = 0
    var sale: Int = 0
    var numberSale: Int = 0
    var rate: Double = 0
    var size: [Int] = []
    var colors: [ObjColors] = []
    
    init() {}
    
    required init(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        imgStr <- map["imgStr"]
        nameSP <- map["nameSP"]
        price <- map["price"]
        sale <- map["sale"]
        numberSale <- map["numberSale"]
        rate <- map["rate"]
        size <- map["size"]
        colors <- map["colors"]
    }
}

class ObjMotBST: Mappable {
    var id: Int = 0
    var idList: [Int] = []
    var nameBST: String = ""
    var banner: String = ""
    
    init() {}
    
    required init(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        idList <- map["idList"]
        nameBST <- map["nameBST"]
        banner <- map["banner"]
    }
}

class ObjMotItemClother: Mappable {
    var id: Int = 0
    var collection: [ObjItemClother] = []
    
    init() {}
    
    required init(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        collection <- map["collection"]
    }
}

class ObjColor: Mappable {
    var id: Int  = 0
    var color: String = ""
    var imgThumb: String = ""
    var imgBig: String = ""
    var isChon: Bool = false
    
    init() {}
    
    required init(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        color <- map["color"]
        imgThumb <- map["imgThumb"]
        imgBig <- map["imgBig"]
    }
}

class ObjSize: Mappable {
    var id: Int = 0
    var size: String = ""
    
    init() {}
    
    required init(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        size <- map["size"]
    }
}

class ObjColors: Mappable {
    var id: Int = 0
    var sizeHet: [Int] = []
    
    init() {}
    
    required init(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        sizeHet <- map["sizeHet"]
    }
    
    func returnColor() -> ObjColor {
        var col: ObjColor = ObjColor()
        for it in (Utility.getListColor()) {
            if (it.id == self.id) {
                col = it
            }
        }
        return col
    }
}

class ObjColorSize {
    var color: ObjColor = ObjColor()
    var listSize: [ObjSize] = []
    
    init() {}
    
    init(color: ObjColor, listSize: [ObjSize]) {
        self.color = color
        self.listSize = listSize
    }
}

class ObjBSTCollect {
    var bst: ObjMotBST = ObjMotBST()
    var collect: [ObjItemClother] = []
    
    init() {}
    
    func returnObjItemClother(index: Int) -> ObjItemClother {
        var ob: ObjItemClother = ObjItemClother()
        for i in 0..<(collect.count) {
            if (index == i) {
                ob = collect[index]
            }
        }
        return ob
    }
}

