import Html exposing (li, text, ul)
import Html.Attributes exposing (class)

main =
  ul [class "grocery-list"]
    [ li [] [text "cheese"]
    , li [] [text "whiskey"]
    , li [] [text "duct tape"]
    , li [] [text "avacados"]
    ]
