//
//  LottoNumberValidator.swift
//  LottoMachine
//
//  Created by Jung peter on 10/12/22.
//

import Foundation

struct LottoNumberValidator {
    
    enum LottoNumberValidatorError: LocalizedError {
        case outOfRange
        
        var errorDescription: String? {
            switch self {
            case .outOfRange:
                return "1~45 범위에 포함되지 않네요!"
            }
        }
    }
    
    static func validate(of number: Int) throws -> Int {
        let validRange: ClosedRange<Int> = 1...45
        let isValid = validRange ~= number
        guard isValid else {
            throw LottoNumberValidatorError.outOfRange
        }
        return number
    }
}
