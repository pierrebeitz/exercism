module SumOfMultiples (sumOfMultiples) where
import Data.List

sumOfMultiples xs limit =
  sum . nub . concat $ [[ i * x | i <- [1..((limit - 1) `div` x)]] | x <- xs]

