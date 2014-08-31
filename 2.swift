var sum: UInt = 0

var previousTerm: UInt = 0
var currentTerm: UInt = 1
while currentTerm < 4_000_000 {
	if currentTerm % 2 == 0 {
		sum += currentTerm
	}
	(currentTerm, previousTerm) = (currentTerm + previousTerm, currentTerm)
}
println(sum)