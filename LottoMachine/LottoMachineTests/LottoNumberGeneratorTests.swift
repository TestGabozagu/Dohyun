//
//  LottoNumberGeneratorTests.swift
//  LottoMachineTests
//
//  Created by Jung peter on 10/14/22.
//

import XCTest
@testable import LottoMachine

class LottoNumberGeneratorTests: XCTestCase {
    
    var sut: LottoNumberGenerator!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LottoNumberGenerator()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    //1번 만들어야지
    func test_lottoNumberCount_equalToSix() throws {
        //given
        
        //when
        let lottoNum = try sut.generate()
        
        //then
        let expectation = 6
        XCTAssertEqual(lottoNum.count, expectation)
    }
    
    //2번 만들었는데, 유효한 값이야?
    func test_whenCallgenerate_lottoNum_AllUnique() throws {
        //given
        
        //when
        let lottoNum = try sut.generate()
        
        //then
        XCTAssertEqual(Set(lottoNum).count, 6)
    }
    
    //다 1...45 사이인가?
    func test_whenCallgenerate_lottoNumbersInrange() throws {
        //given
        
        //when
        let lottoNum = try sut.generate()
        
        let lottoRange = 1...45
        XCTAssertTrue(lottoNum.allSatisfy { lottoRange ~= $0 })
    }

}
