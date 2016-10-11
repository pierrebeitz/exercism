module ListOps exposing (..)

-- for most cases there are more obvious solutions, but i'm trying
-- to fold as much as possible


foldr : (a -> b -> b) -> b -> List a -> b
foldr f acc xs =
    case xs of
        [] ->
            acc

        x :: xs ->
            f x (foldr f acc xs)


foldl : (a -> b -> b) -> b -> List a -> b
foldl f acc xs =
    case xs of
        [] ->
            acc

        x :: xs ->
            foldl f (f x acc) xs


map : (a -> a) -> List a -> List a
map f =
    foldr (f >> (::)) []


length : List a -> Int
length =
    foldr (\_ -> (+) 1) 0


reverse : List a -> List a
reverse =
    foldl (::) []


filter : (a -> Bool) -> List a -> List a
filter f =
    foldr
        (\x xs ->
            if f x then
                x :: xs
            else
                xs
        )
        []


append : List a -> List a -> List a
append xs ys =
    foldr (::) ys xs


concat : List (List a) -> List a
concat =
    foldr append []
