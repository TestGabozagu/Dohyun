//
//  LottoMachine.swift
//  LottoMachine
//
//  Created by Jung peter on 10/4/22.
//

import Foundation

struct LottoMachine {
    
    // 1. numbers 안에 수가 겹치는거 세진
    // 2. 여섯개 넘을 경우 찬미
    // 3. 1 ~ 45 아닌경우 태현
    // 4. 준
    // 5. 수빈 여섯개 미만일 경우
    
    func isValidLottoNumber(of numbers: [Int]) -> Bool {
        guard numbers.count == 6, Set(numbers).count == 6 else {
            return false
        }
        
        for num in numbers {
            guard 1...45 ~= num else {
                return false
            }
        }
        
        return true
    }
    
    func makeRandomLottoNumbersArray() -> [Int] {
        var numberSet: Set<Int> = []
        
        while numberSet.count < 6 {
            let randomNumber = Int.random(in: 1...45)
            numberSet.insert(randomNumber)
        }
        
        return Array(numberSet)
    }
    
    func countingMatchingNumber(user: [Int], winner: [Int]) throws -> Int {
        guard isValidLottoNumber(of: user) && isValidLottoNumber(of: winner) else {
            throw LottoMachineError.invalidNumbers
        }
        
        let winNumbers = user.filter { winner.contains($0) }
        return winNumbers.count
    }
}

enum LottoMachineError: Error {
    case invalidNumbers
}
