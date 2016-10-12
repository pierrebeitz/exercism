module Atbash (decode, encode) where

import Control.Arrow ((>>>))
import Data.Char (chr, ord, isAlpha, isAlphaNum, isAscii, toLower)
import Data.List (intercalate)
import Data.List.Split (chunksOf)


decode :: String -> String
decode xs =
  [ reverseChar x | x <- xs, isAscii x && isAlphaNum x ]


encode :: String -> String
encode =
  decode
  >>> chunksOf 5
  >>> intercalate " "


reverseChar :: Char -> Char
reverseChar c
  | isAlpha c = chr $ ord 'a' + ord 'z' - ord (toLower c)
  | otherwise = c
