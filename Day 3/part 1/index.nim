import os
import sequtils
import strutils, strscans

var
  input = open(os.getAppDir() & "/input.txt")
  stringInput = newSeq[string](0)

for line in input.lines:
  stringInput.add(line)

type
  Coordinate* = object
    x*, y*: int

type
  Claim* = object
    id*, width*, height*: int
    topLeft*: Coordinate

proc formatClaim(rawData: string): Claim =
  var
    id, x, y, w, h: int

  discard scanf(rawData, "#$i @ $i,$i: $ix$i", id, x, y, w, h)

  Claim(
    id: id,
    topLeft: Coordinate(x: x, y: y),
    width: w,
    height: h
  )

const gridSize = 1000
var
  formatted = map(stringInput, formatClaim)
  grid: array[gridSize, array[gridSize, int]]
  counter = 0

for claim in formatted:
  var
    x = claim.topLeft.x
    y = claim.topLeft.y
    w = claim.width
    h = claim.height

  for i in x ..< x + w:
    for j in y ..< y + h:
      inc grid[i][j]
  
for i in 0 ..< gridSize:
  for j in 0 ..< gridSize:
    if grid[i][j] >= 2:
      inc counter
  
echo counter
