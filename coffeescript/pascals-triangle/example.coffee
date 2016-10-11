memoize = (f) ->
  cache = {}
  (x) -> if (a = cache[x])? then a else cache[x] = f x

num = memoize ([row, col]) ->
  return 0 if col < 0 || row < 0
  return 1 if col == row == 0

  num([row - 1, col]) + num([row - 1, col - 1])

module.exports = (n) ->
  array: [0...n].map (row) ->
    [0..row].map (col) ->
      # make use of symmetry
      num [row, row / 2 - Math.abs(col - row / 2)]
