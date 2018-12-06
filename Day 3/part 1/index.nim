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
    rawTopLeft = exploded[2]
    topLeftX = parseInt(rawTopLeft.split(',')[0])
    rawTopLeftY = rawTopLeft.split(',')[1]
    topLeftY = parseInt(rawTopLeftY[0 .. rawTopLeftY.len - 2])
    topLeft = Coordinate(x: topLeftX, y: topLeftY)
    translation = exploded[3].split('x')
    translateX = parseInt(translation[0])
    translateY = parseInt(translation[1])
    bottomRightX = topLeftX + translateX - 1
    bottomRightY = topLeftY + translateY - 1
    bottomRight = Coordinate(x: bottomRightX, y: bottomRightY)

  Claim(
    id: id,
    topLeft: topLeft,
    bottomRight: bottomRight
  )

proc doOverlap(a: Claim, b: Claim) : bool =
  if a.topLeft.x >= b.bottomRight.x or a.topLeft.x >= b.bottomRight.x:
    return false
  if a.topLeft.y <= b.bottomRight.y or a.topLeft.y <= b.bottomRight.y:
    return false
  return true

var formatted = map(stringInput, formatClaim)

for claim in formatted:
  echo claim

echo doOverlap(formatted[0], formatted[2])

# import sequtils

# proc multiply(x: int) : int =
#   x * 2

# var arr = [1, 2, 3, 4]
# var multiplied = map(arr, multiply)

# echo arr
# echo multiplied
