import Graphics.Element exposing (show)

main =
  show (zip ["Tom", "Sue", "Bob"] [45, 31, 26])


zip : List a -> List b -> List (a,b)

zip xs ys =
  case (xs, ys) of
    ( x :: xs', y :: ys' ) ->
      (x,y) :: zip xs' ys'

    (_, _) ->
        []

-- This is a single line comment.
-- zip = List.map2 (,) is the easier way to do this.

