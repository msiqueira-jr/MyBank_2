//
//  Cartoes.swift
//  MyBank
//
//  Created by Mauro Siqueira Jr on 29/10/20.
//

import Foundation


enum Flag: String {
    
    case mastercard = "mastercard"
    case visa = "visa"
    case elo = "elo"
    case none = "outros"
   
    static func loadFlag(index: Int) -> Flag {
        switch index {
        case 0:
            return .visa
        case 1:
            return .mastercard
        case 2:
            return .elo
        default:break
        }
        return .none
    }
}

struct Cartoes: Codable {
    var cartoes:[CartoesElement]
}

struct CartoesElement: Codable {
    
    let id, nome, data, numero,bandeira: String
}
