//
//  LottoRankCheckerTests.swift
//  LottoMachineTests
//
//  Created by Jung peter on 10/15/22.
//

import XCTest
@testable import LottoMachine

class LottoRankCheckerTests: XCTestCase {
    
    var sut: LottoRankChecker!

    override func setUpWithError() throws {
        try super.setUpWithError()
        let winningLotto = [1,2,3,4,5,6]
        sut = try LottoRankChecker(winningLotto: winningLotto)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    // 단순 init이 아니라면, init check는 필수이다.
    func  test_init() {
        let winningLotto = [1,2,3,4,5,6]
        
        XCTAssertNoThrow(try LottoRankChecker(winningLotto: winningLotto))
    }
    
    func test_init_ifinvalidLotto_throwsErorr() throws {
        let winningLotto = [1,2,3,4,5,5]
        
        let expectation = LottoValidator.LottoValidatorError.NotUniqueNumber
        XCTAssertThrowsError(try LottoRankChecker(winningLotto: winningLotto)) { error in
            XCTAssertEqual(error as! LottoValidator.LottoValidatorError, expectation)
        }
    }
    
    func test_init_iflottoNumberLessThan6_throwsError() throws {
        let winningLotto = [1,2,3,4,5]
        
        let expectation = LottoValidator.LottoValidatorError.invalidLottoNumberCount
        XCTAssertThrowsError(try LottoRankChecker(winningLotto: winningLotto)) { error in
            XCTAssertEqual(error as! LottoValidator.LottoValidatorError, expectation)
        }
    }
    
    func test_whenMatchAll_rankIsfirst() {
        //given
        let givenNum = [1,2,3,4,5,6]
        
        let expectation = LottoRank.first
        
        XCTAssertEqual(sut.rank(of: givenNum), expectation)
    }
    
    func test_whenMatchNone_rankIsnone() {
        //given
        let givenNum = [7,8,9,10,11,12]
        
        let expectation = LottoRank.none
        
        XCTAssertEqual(sut.rank(of: givenNum), expectation)
    }


}
