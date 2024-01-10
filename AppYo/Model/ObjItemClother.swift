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
    var size: [Int] = []
    
    init() {}
    
    required init(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        color <- map["color"]
        imgThumb <- map["imgThumb"]
        imgBig <- map["imgBig"]
        size <- map["size"]
    }
}

class ObjSize: Mappable {
    var id: Int = 0
    var size: String = ""
    var daHetSize: Int = 0
    
    init() {}
    
    required init(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        size <- map["size"]
        daHetSize <- map["daHetSize"]
    }
}

