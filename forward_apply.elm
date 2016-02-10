import Color exposing (green, purple)
import Graphics.Collage exposing (collage, filled, move, ngon)

main =
  collage 200 200 [purplePentagon, greenPentagon]

{- this is what a comment looks like in elm -}

purplePentagon =
  ngon 5 50
    |> filled purple
    |> move (20,20)

greenPentagon =
  move (-20,-20) (filled green (ngon 5 50))
