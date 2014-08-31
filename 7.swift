import Cocoa

func prime10001() -> Int {
	let goal = 10001
	let max = 1 << 17 //Had to draw on https://github.com/kconner/ProjectEuler/blob/master/ProjectEuler/7.swift for this one, which made me sad.

	var primes: Array<Bool> = []
	primes.extend(Repeat(count: max, repeatedValue: true))

	var count = 1

	var num = 3
	while num < max {
		if primes[num] {
			++count
			if count == goal {
				return num
			}
			var multiple = 2 * num
			while multiple < max {
				primes[multiple] = false
				multiple += num
			}
		}
		num += 2
	}
	return 0
}

println(prime10001())