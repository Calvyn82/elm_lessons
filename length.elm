import Graphics.Element exposing (show)

main =
  show (length [10..90])

length : List a -> Int
length list =
  case list of
    [] ->
      0

    first :: rest ->
      1 + length rest


{- List.length n is how it work in the library.
   But this lesson shows how lists are structured like 
   length (10 :: (11 :: (12 :: (etc :: [])))) -}
