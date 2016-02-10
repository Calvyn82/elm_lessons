import Graphics.Element exposing (show)

type Either a b c
    = Left a
    | Right b
    | Center c

userIDs : List (Either Int String Bool)
userIDs =
  [Left 42, Right "12A3BC", Left 1337, Right "ZA7T9G", Center True, Center False]

partition : List (Either a b c) -> (List a, List c, List b)
partition eithers =
  case eithers of
    [] ->
      ([], [], [])

    Left a :: rest ->
      let
          (lefts, centers, rights) = partition rest
      in
          (a :: lefts, centers, rights)

    Right b :: rest ->
      let
          (lefts, centers, rights) = partition rest
      in
          (lefts, centers, b :: rights)

    Center c :: rest ->
      let
          (lefts, centers, rights) = partition rest
      in
          (lefts, c :: centers, rights)

main =
  show (partition userIDs)
