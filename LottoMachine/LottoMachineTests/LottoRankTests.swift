//
//  LottoRankTests.swift
//  LottoMachineTests
//
//  Created by Jung peter on 10/15/22.
//

import XCTest
@testable import LottoMachine

class LottoRankTests: XCTestCase {
    
    var sut: LottoRank.Type!

    override func setUpWithError() throws {
       try super.setUpWithError()
        sut = LottoRank.self
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_whenGivenIsmatch3_returnForth() {
        //given
        let matchNum = 3
        
        let expectation = LottoRank.forth
        //when
        //then
        XCTAssertEqual(sut.rank(matchNum: matchNum), expectation)
    }
    
    func test_whenGivenMatchNum_isInvalid() {
        //given
        let matchNum = 11
        
        let expectation = LottoRank.none
        
        XCTAssertEqual(sut.rank(matchNum: matchNum), expectation)
    }


}
