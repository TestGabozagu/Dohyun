//
//  LottoStatisticResult.swift
//  LottoMachine
//
//  Created by Jung peter on 10/12/22.
//

import Foundation


// 뭐해야해?
// 당첨 통계를 출력해야해
// 3개~6개 맞춘 이력을 각각 알아야해
// 총 수익률 빼야해
struct LottoStatisticResult {
    
    private let lottos: [[Int]]
    private let lottoRankChecker: RankCheckable
    
    init(lottos: [[Int]], lottoRankChecker: RankCheckable) {
        self.lottoRankChecker = lottoRankChecker
        self.lottos = lottos
    }
    
    //총 수익률 이거 어케 구현하지? 
    
    func lottoWinningCount(for rank: LottoRank) -> Int {
        return lottos.filter { lottoRankChecker.rank(of:$0) == rank}
            .count
    }
    
    
    
}
