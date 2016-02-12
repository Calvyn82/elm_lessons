import Html exposing (div, button, text)
import Html.Events exposing (onClick)
import StartApp.Simple as StartApp

main =
  StartApp.start { model = 0, view = view, update = update }

view address model =
  div []
    [ button [ onClick address Increment ] [ text "+" ]
    , div [] [ text (toString model) ]
    , button [ onClick address Decrement ] [ text "-" ]
    ]

type Action = Increment | Decrement

update action model =
  case action of
    Increment -> model + 1
    Decrement -> model - 1
