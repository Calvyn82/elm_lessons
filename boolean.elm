import Graphics.Element exposing (..)
import Text

type Expr
    = T
    | F
    | Not Expr
    | And Expr Expr
    | Or Expr Expr

eval : Expr -> Bool
eval expression =
  case expression of
    T -> True

    F -> False

    Not expr ->
      not (eval expr)

    And leftExpr rightExpr ->
      eval leftExpr && eval rightExpr

    Or leftExpr rightExpr ->
      eval leftExpr || eval rightExpr

e1 = T
e2 = And T F
e3 = Or e1 e2
e4 = And (Not e2) e1

main : Element
main =
  flow down (List.map display [e1, e2, e3, e4])

display : Expr -> Element
display expr =
  toString(eval expr) ++ "&lArr; " ++ toString expr
  |> Text.fromString
  |> Text.monospace
  |> leftAligned
