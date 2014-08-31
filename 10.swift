import Cocoa
import Foundation

//Finally got around to writing a prime number generator.

extension Int {
	static var primeCache = Dictionary<Int, Bool>()
	func isPrime() -> Bool {
		if self < 2 {
			return false
		}
		if self == 2 || self == 3 {
			return true
		}
		if self % 2 == 0 {
			return false
		}
		if let cachedVal = Int.primeCache[self] {
			return true
		}

		let squareRoot: Int = Int(sqrt(Double(self)))
		let upperBound = squareRoot
		for i in 3...upperBound {
			if self % i == 0 {
				return false
			}
		}
		Int.primeCache[self] = true
		return true
	}
}

struct PrimeGenerator : Generator {
	typealias Element = Int
	var current = 1
	mutating func next() -> Int? {
		var next = current + 2
		while !next.isPrime() {
			next += 2
		}
		current = next
		return current
	}
}

//This function isn't used here, but it's still good to keep around. I'm sure I'll need it in the future.
func generatePrimes(numPrimes: Int) -> Array<Int> {
	let primeSec = SequenceOf<Int>({ PrimeGenerator() })
	var primes: Array<Int> = [2]
	for number in primeSec {
		println("\(primes.count+1): \(number)")
		if primes.count < numPrimes {
			primes.append(number)
			if primes.count == numPrimes {
				return primes
			}
		}
	}
	return []
}

func primesLessThan(upper: Int) -> Array<Int> {
	let primeSec = SequenceOf<Int>({ PrimeGenerator() })
	var primes: Array<Int> = [2]
	for number in primeSec {
		println(number)
		if number < upper {
			primes.append(number)
		} else {
			return primes
		}
	}
	return []
}

println(primesLessThan(2_000_000).reduce(0, +))