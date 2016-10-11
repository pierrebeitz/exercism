module LeapYear (isLeapYear) where

isLeapYear y
  | m 4 y && m 100 y && m 400 y = True
  | m 4 y && m 100 y            = False
  | m 4 y                       = True
  | otherwise                   = False

m base y =
  y `mod` base == 0

