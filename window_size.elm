import Graphics.Element exposing (..)
import Window

main : Signal Element
main =
  Signal.map resizeablePaint Window.dimensions

resizeablePaint : (Int,Int) -> Element
resizeablePaint (w,h) =
  fittedImage w h "http://elm-lang.org/imgs/paint.jpg"
