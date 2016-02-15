import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (on, targetChecked)
import Signal exposing (Address)
import StartApp.Simple as StartApp

main = StartApp.start { model = initialModel, view = view, update = update }

type alias Model =
  { style : Style
  }

type Style
  = Red
  | Underline
  | Bold
  | Italic

initialModel =
  { style = Bold }

update newStyle model =
  { model | style = newStyle }

view address model =
  div [] <|
    span [toStyle model] [text "Hello, how are you?!"]
    :: br [] []
    :: radio address model Red "red"
    ++ radio address model Underline "underline"
    ++ radio address model Bold "bold"
    ++ radio address model Italic "italic"

toStyle model =
  style <|
    case model.style of
      Red ->
        [("color", "red")]

      Underline ->
        [("text-decoration", "underline")]

      Bold ->
        [("font-weight", "bold")]

      Italic ->
        [("font-style", "italic")]

radio : Address Style-> Model -> Style -> String -> List Html
radio address model style name =
  [ input
    [ type' "radio"
    , checked (model.style == style)
    , on "change" targetChecked (\_ -> Signal.message address style)
    ]
    []
  , text name
  , br [] []
  ]
