import Graphics.Element exposing (show)

add x y =
  x + y

factorial : Int -> Int
factorial n =
  List.product [1..n]

summation : Int -> Int
summation n =
  List.sum [1..n]

main =
  show (add (summation 12) (factorial 4))
