//
//  LottoMachineTests.swift
//  LottoMachineTests
//
//  Created by Jung peter on 10/4/22.
//

import XCTest
@testable import LottoMachine

class LottoMachineTests: XCTestCase {
    
    var sut: LottoMachine!
    
    // setup
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = LottoMachine()
    }

    // 해제
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()
    }
    
    // MARK: - Given
    
    func givenInputLottoNumberList(nums: [Int]) -> [Int]{
        return nums
    }
    
    // MARK: - When
    
    
    
    //numbers 안에 수가 겹치는거 세진
    func test_isValidLottoNumber호출시_112345시_False를반환하는지() {
        
        //given
        let input = givenInputLottoNumberList(nums: [1,2,34,11,22])
        
        //when
        let result = sut.isValidLottoNumber(of: input)
        
        //then
        XCTAssertFalse(result)
        
    }
    
    // 2. 여섯개 넘을 경우 찬미
    func test_isValidLottoNumber호출시_1234567_False를반환하는지() {
        
        //given
        let input = [1,2,3,4,5,6,7]
        
        //when
        let result = sut.isValidLottoNumber(of: input)
        
        //then
        XCTAssertFalse(result)
    }
    
    // 3. 1 ~ 45 아닌경우 태현
    func test_inValidLottoNumber호출시_1234550_False를반환하는지() {
        
        //given
        let input = [1,2,3,4,5,50]
        
        //when
        let result = sut.isValidLottoNumber(of: input)
        
        //then
        XCTAssertFalse(result)
        
    }
    
    // 4. 같은 숫자일 경우
    func test_inValidLottoNumber호출시_777777_False를반환하는지() {
        //given
        let input = givenInputLottoNumberList(nums: [7,7,7,7,7,7])
        
        //when
        let result = sut.isValidLottoNumber(of: input)
        
        //then
        XCTAssertFalse(result)
    }
    
    
    func test_inValidLottoNumber호출시_7777_False를반환하는지() {
        //given
        let input = givenInputLottoNumberList(nums: [7,7,7,7,7,7])
        
        //when
        let result = sut.isValidLottoNumber(of: input)
        
        //then
        XCTAssertTrue(result)
    }
    
}
