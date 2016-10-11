require 'pp'
class Diamond
  A = 'A'.ord

  def self.make_diamond(letter)
    diamond(size letter) + "\n"
  end

  private

  def self.size(letter)
    2 * (letter.ord - A) + 1
  end

  def self.diamond(size)
    (0...size).each.map{ |r| row(r, size) }.join("\n")
  end

  def self.row(i, size)
    (0...size).map{ |j| letter(i, j, size / 2) }.join
  end

  def self.letter(i, j, s2)
    if (s2 - i).abs + (s2 - j).abs == s2
      ((s2 - (s2 - i).abs) + A).chr
    else
      ' '
    end
  end
end
