import Cocoa

func sumOfSquares(range: Range<Int>) -> Int {
	var sum = 0
	for i in range {
		sum += Int(pow(Double(i), 2))
	}
	return sum
}

func squareOfSum(range: Range<Int>) -> Int {
	var sum = 0
	for i in range {
		sum += Int(i)
	}
	return Int(pow(Double(sum), 2))
}

let range = 0...100

println(squareOfSum(range) - sumOfSquares(range))