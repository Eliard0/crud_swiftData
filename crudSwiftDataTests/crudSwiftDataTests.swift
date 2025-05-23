//
//  crudSwiftDataTests.swift
//  crudSwiftDataTests
//
//  Created by Eliardo Venancio on 22/05/25.
//

import XCTest
@testable import crudSwiftData


final class crudSwiftDataTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        
        measure {
        }
    }
    
    func testCreatedTask() throws {
        let task = ModelTask(title: "Estudar Swift", description: "Focar no SwiftData")
        
        XCTAssertEqual(task.titleTask, "Estudar Swift")
        XCTAssertEqual(task.descriptionTask, "Focar no SwiftData")
        XCTAssertFalse(task.isCompletedTask)
    }
    
    func testValidationField() throws {
        
    }
    
    func testCamposValidos() throws {
        let task = ModelTask(title: "  ", description: "Aprender SwiftData")
        
        let titleValid = !task.titleTask.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        let descriptionValid = !task.descriptionTask.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        
        XCTAssertTrue(titleValid, "O título não deve estar vazio")
        XCTAssertTrue(descriptionValid, "A descrição não deve estar vazia")
    }
    
    
}
