import Cocoa

func isPalendrome(n: Int) -> Bool {
	var original = n
	var reversed = 0
	while original > 0 {
		reversed *= 10
		reversed += original % 10
		original /= 10
	}
	return n == reversed
}

func largestPalendromeMultiple(lower: Int = 100, upper: Int = 999) -> Int {
	var largest = 0
	for var left = upper; left >= lower; --left {
		for var right = left; right >= lower; --right {
			let product = left * right
			if product > largest && isPalendrome(product) {
				largest = product
			}
		}
	}
	return largest
}

println(largestPalendromeMultiple())