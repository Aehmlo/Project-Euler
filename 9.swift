import Cocoa

typealias PythagoreanTriple = (a: Int, b: Int, c: Int) //I mean, how could I resist? Tuples, triples - it's all the same thing.

func tripleWithSum(sum: Int) -> PythagoreanTriple {
	for var a = 1; a<sum; a++ {
		for var b = 2; b < a; b++ {
			let c = sum - a - b
			if a*a + b*b == c * c { 
				return PythagoreanTriple(a, b, c)
			}
		}
	}
	return PythagoreanTriple(0, 0, 0)
}

func productOfTriple(triple: PythagoreanTriple) -> Int {
	return triple.a * triple.b * triple.c
}

println(productOfTriple(tripleWithSum(1000)))