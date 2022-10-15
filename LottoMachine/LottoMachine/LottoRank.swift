//
//  LottoRank.swift
//  LottoMachine
//
//  Created by Jung peter on 10/12/22.
//

import Foundation


// LottoRank
// 뭐해야해?
// 몇등까지인지?
// rank를 뺴야지 ㅇㅇ 어케??
enum LottoRank {
    case first
    case second
    case third
    case forth
    case fifth
    case none
    
    static func rank(matchNum: Int) -> LottoRank {
        switch matchNum {
        case 6:
            return .first
        case 5:
            return .second
        case 4:
            return .third
        case 3:
            return .forth
        case 2:
            return .fifth
        default:
            return .none
        }
    }
    
    var priceMoney: Int {
        switch self {
        case .first:
            return 2000000000
        case .second:
            return 30000000
        case .third:
            return 1500000
        case .forth:
            return 50000
        case .fifth:
            return 5000
        case .none:
            return 0
        }
    }
}
