import Graphics.Element exposing (show)
import List exposing (filter)

main =
  show (quicksort [5,3,8,1,9,4,7])

quicksort : List comparable -> List comparable
quicksort list =
  case list of
    [] ->
      []

    pivot :: rest ->
      let
          lower  = filter (\n -> n <= pivot) rest
          higher = filter (\n -> n >  pivot) rest
      in
         quicksort lower ++ [pivot] ++ quicksort higher
