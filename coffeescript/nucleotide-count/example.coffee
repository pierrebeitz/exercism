module.exports =
  class Dna
    constructor: (nucleotides) ->
      @nucleotideCounts = sort nucleotides

    count: (s) ->
      count = @nucleotideCounts[s]
      throw new Error('Invalid Nucleotide') unless count?
      count

    # private

    sort = (dna, acc = {A: 0, T: 0, C: 0, G: 0}) ->
      return acc if dna == ''
      acc[dna[0]] += 1
      sort dna[1..-1], acc
