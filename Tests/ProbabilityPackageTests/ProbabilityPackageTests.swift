import XCTest
@testable import ProbabilityPackage

final class ProbabilityPackageTests: XCTestCase {
    func testFactorial() throws {
        XCTAssertThrowsError(try factorial(-1))
        XCTAssertEqual(try factorial(0), 1)
        XCTAssertEqual(try factorial(4), 24)
        XCTAssertEqual(try factorial(5), 120)
        XCTAssertEqual(try factorial(12),479001600)
        XCTAssertThrowsError(try factorial(21))
    }
    
    func testBinomialCoeffient() throws {
        XCTAssertEqual(try binomialCoefficient(n: 1, k: 0), 1)
        XCTAssertEqual(try binomialCoefficient(n: 1, k: 1), 1)
        XCTAssertEqual(try binomialCoefficient(n: 2, k: 2), 1)
        XCTAssertEqual(try binomialCoefficient(n: 5, k: 3), 10)
        XCTAssertEqual(try binomialCoefficient(n: 6, k: 2), 15)
        XCTAssertEqual(try binomialCoefficient(n: 10, k: 5), 252)
        XCTAssertEqual(try binomialCoefficient(n: 12, k: 4), 495)
        XCTAssertEqual(try binomialCoefficient(n: 20, k: 10), 184756)
        XCTAssertThrowsError(try binomialCoefficient(n: 2, k: 3))
        XCTAssertThrowsError(try binomialCoefficient(n: 1, k: 20))
        XCTAssertThrowsError(try binomialCoefficient(n: 0, k: 0))
    }
    
    func testProbabilities() throws {
        XCTAssertEqual(probability(successes: 0, testCount: 3), 0.125)
        XCTAssertEqual(probability(successes: 0, testCount: 6), 0.015625)
        XCTAssertEqual(probability(successes: 2, testCount: 2), 0.25)
        XCTAssertEqual(probability(successes: 5, testCount: 4), 0.0)
        XCTAssertEqual(probability(successes: 3, testCount: 2), 0.0)
        XCTAssertEqual(probability(successes: 6, testCount: 6), 0.015625)
        XCTAssertEqual(probability(successes: 10, testCount: 16), 0.1221923828125)
        XCTAssertEqual(probability(successes: 3, testCount: 21), 0.0)
    }
}
