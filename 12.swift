import Cocoa
import Foundation

extension Int {
	func numberOfDivisors() -> Int {
		var n = self
		var p = 0
		var divisors = 0
		if n % 2 == 0 {
			n /= 2
		}
		divisors = 1
		var count = 0
		while n % 2 == 0 {
			count += 1
			n /= 2
		}
		divisors = divisors * (count + 1)
		p = 3
		while n != 1 {
			count = 0
			while n % p == 0 {
				count += 1
				n /= p
			}
			divisors = divisors * (count + 1)
			p += 2
		}
		return divisors
	}
}

func smallestNumberWithMinimumDivisors(min: Int = 500) -> Int {
	var n = 1
    var (l, r) = (n.numberOfDivisors(), (n+1).numberOfDivisors())
    while l * r < min {
        n += 1
        (l, r) = (r, (n+1).numberOfDivisors())
    }
    return (n * (n + 1)) / 2
}

println(smallestNumberWithMinimumDivisors())