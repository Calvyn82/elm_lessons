import Graphics.Element exposing (show)

four =
  2 + 2

sixteen =
  8 * 2

eleven =
  4 * 3 - 1

thirteen =
  4 * 3 + 1

isTeenage age =
  age > 12 && age < 20

main =
  show
    [ isTeenage four
    , isTeenage sixteen
    , isTeenage eleven
    , isTeenage thirteen
    ]
