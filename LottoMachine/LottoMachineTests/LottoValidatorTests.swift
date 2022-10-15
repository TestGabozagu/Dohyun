//
//  LottoValidatorTests.swift
//  LottoMachineTests
//
//  Created by Jung peter on 10/15/22.
//

import XCTest
@testable import LottoMachine

class LottoValidatorTests: XCTestCase {
    
    var sut: LottoValidator.Type!

    override func setUpWithError() throws {
       try super.setUpWithError()
        sut = LottoValidator.self
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func test_validate() throws {
        //given
        let input = [1,2,3,4,5,6]
        
        //when
        //then
        XCTAssertNoThrow(try sut.validate(of: input))
    }
    
    func test_inputCountIsUnder6_throwsinvalidLottoNumberCount() throws {
        //givne
        let input = [1,2,3,4,5]
        
        let expectation = LottoValidator.LottoValidatorError.invalidLottoNumberCount
        //then
        XCTAssertThrowsError(try sut.validate(of: input)) { error in
            XCTAssertEqual(error as! LottoValidator.LottoValidatorError, expectation)
        }
    }
    
    func test_inputHasSameNumber_throwsNotUniqueNumber() throws {
        
        //given
        let input = [1,2,3,4,4,4]
        
        let expectation = LottoValidator.LottoValidatorError.NotUniqueNumber
        
        //then
        XCTAssertThrowsError(try sut.validate(of: input)) { error in
            XCTAssertEqual(error as! LottoValidator.LottoValidatorError, expectation)
        }
    }

}
