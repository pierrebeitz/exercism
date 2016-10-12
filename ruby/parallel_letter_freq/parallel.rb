require 'benchmark'
require 'pp'
require 'thread'
require 'parallel'

TEXTS = [

  "Freude schöner Götterfunken
  Tochter aus Elysium,
  Wir betreten feuertrunken,
  Himmlische, dein Heiligtum!
  Deine Zauber binden wieder
  Was die Mode streng geteilt;
  Alle Menschen werden Brüder,
  Wo dein sanfter Flügel weilt.",

  "Wilhelmus van Nassouwe
  ben ik, van Duitsen bloed,
  den vaderland getrouwe
  blijf ik tot in den dood.
  Een Prinse van Oranje
  ben ik, vrij, onverveerd,
  den Koning van Hispanje
  heb ik altijd geëerd.",

  "O say can you see by the dawn's early light,
  What so proudly we hailed at the twilight's last gleaming,
  Whose broad stripes and bright stars through the perilous fight,
  O'er the ramparts we watched, were so gallantly streaming?
  And the rockets' red glare, the bombs bursting in air,
  Gave proof through the night that our flag was still there;
  O say does that star-spangled banner yet wave,
  O'er the land of the free and the home of the brave?",
]

def count(s)
  map = Hash.new(0)
  s.chars.each do |letter|
    map[letter] += 1
  end
  map
end

n = 20000
Benchmark.bmbm do |x|
  x.report("count") do
    for _i in 1..n
      count(TEXTS.join)
    end
  end

  x.report("count2") do
    Parallel.each(1..n) do
      count TEXTS.join
    end
  end
end

