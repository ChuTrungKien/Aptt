//
//  Utility.swift
//  AppPt
//
//  Created by QRVN on 21/12/2023.
//

import Foundation
import ObjectMapper

let SCREEN_WIDTH: CGFloat = UIScreen.main.bounds.width
let SCREEN_HEIGHT: CGFloat = UIScreen.main.bounds.height

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
    
    static func getListSize() -> [ObjSize] {
        if let path = Bundle.main.url(forResource: "size", withExtension: "json") {
            do {
                let data = try String(contentsOf: path, encoding: .utf8)
                return Mapper<ObjSize>().mapArray(JSONString: data) ?? []
            } catch {
                return []
            }
        }
        return []
    }
    
    static func getListColor() -> [ObjColor] {
        if let path = Bundle.main.url(forResource: "color", withExtension: "json") {
            do {
                let data = try String(contentsOf: path, encoding: .utf8)
                return Mapper<ObjColor>().mapArray(JSONString: data) ?? []
            } catch {
                return []
            }
        }
        return []
    }
}
