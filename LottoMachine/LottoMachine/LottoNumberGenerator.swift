//
//  LottoNumberGenerator.swift
//  LottoMachine
//
//  Created by Jung peter on 10/12/22.
//

import Foundation

struct LottoNumberGenerator {
    
    // LottoNumberValidator
    // LottoValidator
    // 이거 2개가 다 테스트 되었다면, 난 generator를 테스트할 수 있다.
    func generate() throws -> [Int] {
        var lottoSet = Set<Int>()
        while lottoSet.count != 6 {
            let randomNumber = try LottoNumberValidator.validate(of: Int.random(in: 1...45))
            lottoSet.insert(randomNumber)
        }
        let lotto = try LottoValidator.validate(of: Array(lottoSet))
        return lotto
    }
    
}
