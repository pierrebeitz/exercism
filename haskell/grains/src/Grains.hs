module Grains (square, total) where
import Data.Maybe

square x
  | x <= 0 = Nothing
  | x == 1 = Just 1
  | x > 64 = Nothing
  | otherwise = Just $ 2 ^ (x - 1)

total =
  (2 ^ 64) - 1
