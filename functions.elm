import Graphics.Element exposing (show)

four =
  sqrt 16

eleven =
  max 2 11

twenty =
  max (sqrt 100) (4 * 5)

main =
  show [four, eleven, twenty]
