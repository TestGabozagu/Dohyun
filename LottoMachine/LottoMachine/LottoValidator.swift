//
//  LottoValidator.swift
//  LottoMachine
//
//  Created by Jung peter on 10/14/22.
//

import Foundation

// 뭐해야해?
// 근데 여기서는 이미 1 ~ 45 가 검증된 숫자가 넘어오지
// 그러면?
// 6개가 맞는지?
// 중복처리?
// 역시 그냥 벨리데이션이니깐 걍 static으로만 ㄱㅈㅇ
// 애러 처리도 해주고
// 이거 2개만 해줘도 될듯?
struct LottoValidator {
    
    enum LottoValidatorError: LocalizedError {
        case invalidLottoNumberCount
        case NotUniqueNumber
        
        var errorDescription: String? {
            switch self {
            case .invalidLottoNumberCount:
                return "로또 번호 개수가 6개가 아닙니다."
            case .NotUniqueNumber:
                return "중복된 로또 번호가 존재합니다."
            }
        }
    }
    
    static func validate(of numbers: [Int]) throws -> [Int] {
        try validateLottoNumberCount(of: numbers)
        try validateLottoNumberIsUnique(of: numbers)
        return numbers
    }
    
    // 약간 이렇게 내부 코드는 private으로 돌려두고
    // 꼭 필요한 기능을 interval로 열어서
    // test하는 것도 방법인것같다?
    private static func validateLottoNumberCount(of numbers: [Int]) throws {
        guard numbers.count == 6 else {
            throw LottoValidatorError.invalidLottoNumberCount
        }
    }
    
    private static func validateLottoNumberIsUnique(of numbers: [Int]) throws {
        guard numbers.count == 6 && Set(numbers).count == 6 else {
            throw LottoValidatorError.NotUniqueNumber
        }
    }
    
}
