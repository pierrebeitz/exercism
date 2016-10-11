module Sublist (Sublist(..), sublist) where

data Sublist = Equal | Sublist | Superlist | Unequal deriving (Eq, Show)

sublist :: Eq a => [a] -> [a] -> Sublist
sublist x y =
  case compare (length x) (length y) of
    EQ -> if x == y then Equal else Unequal
    LT -> if isSublist x y then Sublist else Unequal
    GT -> if isSublist y x then Superlist else Unequal

isSublist [] _ = True
isSublist _ [] = False
isSublist x (y:ys) =
    matches x (y:ys) || isSublist x ys

matches [] _ = True
matches _ [] = False
matches (x:xs) (y:ys) =
    x == y && matches xs ys
