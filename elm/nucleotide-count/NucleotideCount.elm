module NucleotideCount exposing (..)

import String exposing (fromChar, uncons)


type alias NucleotideCount =
    { a : Int, t : Int, c : Int, g : Int }


nucleotideCounts : String -> NucleotideCount
nucleotideCounts s =
    let
        ( _, acc ) =
            nucleotideCounts' ( s, { a = 0, t = 0, c = 0, g = 0 } )
    in
        acc


nucleotideCounts' : ( String, NucleotideCount ) -> ( String, NucleotideCount )
nucleotideCounts' ( s, acc ) =
    let
        updateAcc nucleotide =
            case nucleotide of
                'A' ->
                    { acc | a = acc.a + 1 }

                'T' ->
                    { acc | t = acc.t + 1 }

                'C' ->
                    { acc | c = acc.c + 1 }

                'G' ->
                    { acc | g = acc.g + 1 }

                _ ->
                    Debug.crash <| "There's something severely wrong with your DNA! It contains " ++ fromChar nucleotide
    in
        case (uncons s) of
            Just ( nucleotide, rest ) ->
                nucleotideCounts' ( rest, updateAcc nucleotide )

            Nothing ->
                ( s, acc )


version : Int
version =
    2
