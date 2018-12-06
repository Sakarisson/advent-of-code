import os
import sequtils
import strutils

var
  input = open(os.getAppDir() & "/testInput.txt")
  stringInput = newSeq[string](0)

for line in input.lines:
  stringInput.add(line)

type
  Coordinate* = object
    x*, y*: int

type
  Claim* = object
    id*: int
    topLeft*, bottomRight*: Coordinate

proc formatClaim(rawData: string): Claim =
  var exploded = rawData.split(' ')
  var
    rawId = exploded[0]
    id = parseInt(rawId[1 .. rawId.len - 1])
  echo id
  Claim(
    id: 123,
    topLeft: Coordinate(x: 3, y: 7),
    bottomRight: Coordinate(x: 5, y: -3)
  )

var formatted = map(stringInput, formatClaim)

for claim in formatted:
  echo claim

# import sequtils

# proc multiply(x: int) : int =
#   x * 2

# var arr = [1, 2, 3, 4]
# var multiplied = map(arr, multiply)

# echo arr
# echo multiplied
