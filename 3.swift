import Cocoa

func largestPrimeFactor(let n: Int) -> Int {
	for factor in 2...Int(ceil(sqrt(Double(n)))) {
		if(n % factor == 0) {
			return largestPrimeFactor(n/factor)
		}
	}
	return n
}

println(largestPrimeFactor(600_851_475_143))