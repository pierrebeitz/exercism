memoize = (f) ->
  cache = {}
  (x) -> if (a = cache[x])? then a else cache[x] = f x

numberFor = memoize ([row, col]) ->
  # due to returning 0 for "invalid" cols and rows i am able to just
  # stupidly look for both parents in the row above, saving complexity
  return 0 if col < 0 || row < 0
  return 1 if col == row == 0

  numberFor([row - 1, col - 1]) + numberFor([row - 1, col])

module.exports = (n) ->
  array: [0...n].map (row) ->
    [0..row].map (col) ->
      symmetricCol = row / 2 - Math.abs(col - row / 2)
      numberFor [row, symmetricCol]
