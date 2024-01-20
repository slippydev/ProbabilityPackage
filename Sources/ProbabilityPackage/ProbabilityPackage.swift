import Foundation

/// Calculate the factorial of a given integer value. A factorial is the result of multiplying a number by all the smaller whole numbers.
///
/// Factorials are written with an exclamation mark in mathematics. So 5! is 5x4x3x2x1 = 120
/// This function can only accept values of n between 0 and 20, otherwise it will throw a ``ProbabilityError``.
/// - parameter n: number to calculate the factorial value for
/// - returns: An Int representing the factorial of n
public func factorial(_ n: Int) throws -> Int {
    guard n <= 20 else {
        throw ProbabilityError.badInput("Number must be 20 or smaller.")
    }
    guard n >= 0 else {
        throw ProbabilityError.badInput("Number must be 0 or greater")
    }
    if n == 0 { return 1 }
    return (1...n).reduce(1, { $0 * $1 })
}

/// Calculate the binomialCoefficient which is the number of ways, disregarding order, that k objects can be chosen from among n objects. It tells
/// us how many different combinations we can make from a group of things.
///
/// Throws a ``ProbabilityError`` for invalid values. n must be equal to or larger than k
/// - parameter n: The size of the group of objects we will be choosing from
/// - parameter k: The number of objects to choose from the total
/// - returns: An integer representing the number of different ways we can choose k objects from n objects.
public func binomialCoefficient(n: Int, k: Int) throws -> Int {
    guard n >= k else {
        throw ProbabilityError.badInput("n must be greater than or equal to k")
    }
    guard n > 0 else {
        throw ProbabilityError.badInput("n must be greater than 0")
    }
    return try factorial(n) / (factorial(k) * factorial(n - k))
}

/// Callculate the probability of getting exactly k successes from n tests with a success probability of p for each test.
///
/// Throws a ``ProbabilityError`` for invalid values. n must be equal to or larger than k
///  - parameter successes: number of desired successes
///  - parameter testCount: number of tests to conduct
///  - parameter successProb: probability of success for each test; defaults to 0.5
///  - returns: Probability expressed as a Double value between 0 and 1
public func probability(successes k: Int, testCount n: Int, successProb p: Double = 0.5) -> Double {
    guard n >= k else { return 0 }
    do {
        return try Double(binomialCoefficient(n: n, k: k)) * pow(Double(p), Double(k)) * pow(Double(1-p), Double(n-k))
    } catch {
        return 0
    }
}

/// Calculate the probability of getting k or more success from n tests, with a success probability of p for each test.
///
/// Throws a ``ProbabilityError`` for invalid values. `testCount` must be greater than or equal to `successes`.
/// - parameter successes:minimum number of desired successes
/// - parameter testCount: number of tests to conduct
/// - parameter verbose: boolean flag to print probablility calculation details to the console
/// - parameter successProb: probability of success for each test; defaults to 0.5
/// - returns: Probability expressed as a Double value between 0 and 1
public func probGreaterThanOrEqual(successes k: Int, testCount n: Int, verbose: Bool = false, successProb: Double = 0.5) -> Double {
    var sum: Double = 0
    for i in k...n {
        let prob = probability(successes: i, testCount: n)
        if verbose { print("Probability of \(i) success from \(n) dice: \(prob)") }
        sum += prob
    }
    if verbose { print("Probability of \(k) or more successes from \(n) dice: \(sum)") }
    return sum
}
