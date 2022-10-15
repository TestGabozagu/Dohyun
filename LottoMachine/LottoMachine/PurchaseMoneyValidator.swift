//
//  PurchaseMoneyValidator.swift
//  LottoMachine
//
//  Created by Jung peter on 10/12/22.
//

import Foundation


// 뭐해야함?
// 이렇게 나눠야지 그래도 잘나눠진듯
// validator들은 상태저장을 안하기에, 걍 static 처리해도 좋음
// 1000원 단위로 안나눠지면 애러임
// 1000원 미만이면 애러임
// 몇개살지고를수있음
struct PurchaseMoneyValidator {
    
    enum PurchaseLottoValidatorError: LocalizedError {
        case notEnoughMoney
        case invalidMoneyUnit
        case invalidPurchaseCount
        
        var errorDescription: String? {
            switch self {
            case .notEnoughMoney:
                return "1000원 이상의 금액을 지불해주세요"
            case .invalidMoneyUnit:
                return "1000원으로 떨어지는 금액을 지불해주세요"
            case .invalidPurchaseCount:
                return "유효한 로또 구입 개수를 입력해주세요"
            }
        }
    }
    
    
    static func validate(money: Int) throws {
        guard money >= 1000 else {
            throw PurchaseLottoValidatorError.notEnoughMoney
        }
        guard money % 1000 == 0 else {
            throw PurchaseLottoValidatorError.invalidMoneyUnit
        }
    }
    
    static func validate(count: Int, money: Int) throws {
        let maxPurchaseableCount = money / 1000
        let purchaseableRange = 0...maxPurchaseableCount
        guard purchaseableRange ~= count else {
            throw
            PurchaseLottoValidatorError.invalidPurchaseCount
        }
        
    }
    
    
}
