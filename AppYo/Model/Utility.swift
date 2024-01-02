//
//  Utility.swift
//  AppPt
//
//  Created by QRVN on 21/12/2023.
//

import Foundation
import ObjectMapper

public class Utility {
    static func getListBoItemClother() -> [ObjMotItemClother] {
        if let path = Bundle.main.url(forResource: "motItemClother", withExtension: "json") {
            do {
                let data = try String(contentsOf: path, encoding: .utf8)
                return Mapper<ObjMotItemClother>().mapArray(JSONString: data) ?? []
            } catch {
                return []
            }
        }
        return []
    }
    
    static func getListBoST() -> [ObjMotBST] {
        if let path = Bundle.main.url(forResource: "motBoST", withExtension: "json") {
            do {
                let data = try String(contentsOf: path, encoding: .utf8)
                return Mapper<ObjMotBST>().mapArray(JSONString: data) ?? []
            } catch {
                return []
            }
        }
        return []
    }
}
