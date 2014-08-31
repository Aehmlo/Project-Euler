import Cocoa

func LCM(left: Int, right: Int) -> Int {
	var lcm = 0, hcf = 1
	var i = 1
	var max = left < right ? left : right
	while i<=max {
		if left % i == 0 && right % i == 0 {
			hcf = i
		}
		++i
	}
	lcm = left * right / hcf
	return lcm
}

func lowestDivisibleBy(#max: Int) -> Int {
	var lcm = 1
	for var i = 2; i <= max; ++i {
		lcm = LCM(lcm, i)
	}
	return lcm
}

println(lowestDivisibleBy(max: 20))