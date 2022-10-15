//
//  LottoRankChecker.swift
//  LottoMachine
//
//  Created by Jung peter on 10/12/22.
//

import Foundation


// 뭐해야해?
// 일단 정답이있어야해
// 근데 이친구는 걍 체커일 뿐임
// 생성자에 그니깐 정답이 들어와야해
// 근데 정답도 Lotto숫자의 규칙을 따라야겠지?


// 이거를 구현했을때 안했을때와의 차이점은???? 스터디때 생각해보기
protocol RankCheckable {
    func rank(of lotto: [Int]) -> LottoRank
}

struct LottoRankChecker: RankCheckable {
    
    private let winningLotto: [Int]
    
    init(winningLotto: [Int]) throws {
        let winningLotto = try LottoValidator.validate(of: winningLotto)
        self.winningLotto = winningLotto
    }
    
    //1. 몆개 맞는지 파악하기 - 이건 private 해도 ㄱㅊ을듯 다른 객체들이 알필요없는듯함
    private func matchWithWinner(from lotto: [Int]) -> Int {
        let winner = Set(winningLotto)
        let lotto = Set(lotto)
        
        let intersection = winner.intersection(lotto)
        
        return intersection.count
    }
    
    //2. 이게 몇등인지 파악하기, 이건 internal이어야함
    func rank(of lotto: [Int]) -> LottoRank {
        let matchNum = matchWithWinner(from: lotto)
        return LottoRank.rank(matchNum: matchNum)
    }
    
}
