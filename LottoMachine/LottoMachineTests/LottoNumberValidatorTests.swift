//
//  LottoNumberValidatorTests.swift
//  LottoMachineTests
//
//  Created by Jung peter on 10/14/22.
//

import XCTest
@testable import LottoMachine

class LottoNumberValidatorTests: XCTestCase {

    var sut: LottoNumberValidator.Type!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LottoNumberValidator.self
    }

    override func tearDownWithError() throws {
        sut = nil
       try super.tearDownWithError()
    }
    
    // 뭐해야함
    // 1. 각각의 숫자가 1 ~ 45 인지 확인해야함
    // 2. 이거슨 확실히 오류를 뺴야함
    // 3. sujin님꺼보면서 알게된거! 어차피 validator는 상태저장할 필요가 없음 -> static으로 다 조져도 무방하다. ㄹㅇ 똑똑하네.. 코드에 철학이있다..!
    
    func test_validate() {
        //given
        let input = 45
        
        //when
        //then
        XCTAssertNoThrow(try sut.validate(of: input))
    }
    
    // 오류값을 넣고 싶지 않니?
    func test_validateNumber_whenNumberIsOver45() {
        // given
        let lottoNumber = 47
        
        //when
        //then
        let expectation = LottoNumberValidator.LottoNumberValidatorError.outOfRange
        
        XCTAssertThrowsError(try sut.validate(of: lottoNumber)) { error in
            XCTAssertEqual(error as? LottoNumberValidator.LottoNumberValidatorError, expectation)
        }
    }
    
    func test_validateNumber_whenNumberIs0() {
        //given
        let lottoNumber = 0
        
        //when
        //then
        let expectation = LottoNumberValidator.LottoNumberValidatorError.outOfRange
        
        XCTAssertThrowsError(try sut.validate(of: lottoNumber), "1~45 범위에 포함되지 않네요!") { error in
            XCTAssertEqual(error as! LottoNumberValidator.LottoNumberValidatorError, expectation)
        }
    }

}
