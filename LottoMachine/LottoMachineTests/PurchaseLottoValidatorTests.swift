//
//  PurchaseLottoValidatorTests.swift
//  LottoMachineTests
//
//  Created by Jung peter on 10/15/22.
//

import XCTest
@testable import LottoMachine

class PurchaseLottoValidatorTests: XCTestCase {
    
    var sut: PurchaseMoneyValidator.Type!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = PurchaseMoneyValidator.self
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_moneyLessthan1000_throwsError() throws {
        let money = 900
        
        let expectation = PurchaseMoneyValidator.PurchaseLottoValidatorError.notEnoughMoney
        XCTAssertThrowsError(try sut.validate(money: money)) { error in
            XCTAssertEqual(error as! PurchaseMoneyValidator.PurchaseLottoValidatorError, expectation)
        }
    }
    
    func test_moneyInvalidMoneyUnit_throwsError() throws {
        let money = 10001
        
        let expectation = PurchaseMoneyValidator.PurchaseLottoValidatorError.invalidMoneyUnit
        
        XCTAssertThrowsError(try sut.validate(money: money)) { error in
            XCTAssertEqual(error as! PurchaseMoneyValidator.PurchaseLottoValidatorError, expectation)
        }
    }
    
    func test_invalidCountForPurchase_throwsError() throws {
        let count = 2
        let money = 1000
        
        let expectation = PurchaseMoneyValidator.PurchaseLottoValidatorError.invalidPurchaseCount
        
        XCTAssertThrowsError(try sut.validate(count: count, money: money)) { error in
            XCTAssertEqual(error as! PurchaseMoneyValidator.PurchaseLottoValidatorError, expectation)
        }
    }
    
    //돈냈으면?
    func test_validCountAndMoney_notthrowsErorr() throws {
        //given
        let count = 2
        let money = 4000
        
        //then
        XCTAssertNoThrow(try sut.validate(count: count, money: money))
        
    }
    

}
