import Graphics.Element exposing (show)

type Either a b
  = Left a
  | Right b

userIDs : List (Either Int String)
userIDs =
  [Left 42, Right "12ABC", Left 1337, Right "ZA7T9G"]

partition : List (Either a b) -> (List a, List b)
partition eithers =
  case eithers of
    [] ->
      ([], [])

    Left a :: rest ->
      let
          (lefts, rights) = partition rest
      in
         (a :: lefts, rights)

    Right b :: rest ->
      let
          (lefts, rights) = partition rest
      in
         (lefts, b :: rights)

main =
  show (partition userIDs)
