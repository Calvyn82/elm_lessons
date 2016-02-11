import Graphics.Element exposing (..)
import Text

type Tree a
    = Empty
    | Node a (Tree a) (Tree a)

empty : Tree a
empty =
  Empty

singleton : a -> Tree a
singleton v =
  Node v Empty Empty

insert : comparable -> Tree comparable -> Tree comparable
insert x tree =
  case tree of
    Empty ->
      singleton x

    Node y left right ->
      if x > y then
         Node y left (insert x right)

      else if x < y then
         Node y (insert x left) right

      else
         tree

fromList : List comparable -> Tree comparable
fromList xs =
  List.foldl insert empty xs

depth : Tree a -> Int
depth tree =
  case tree of
    Empty -> 0
    Node v left right ->
      1 + max (depth left) (depth right)

map : (a -> b) -> Tree a -> Tree b
map f tree =
  case tree of
    Empty -> Empty
    Node v left right ->
      Node (f v) (map f left) (map f right)

t1 = fromList [1,2,3]
t2 = fromList [2,1,3]

sum : Tree number -> number
sum tree =
  case tree of
    Empty -> 0
    Node v left right ->
      v + sum left + sum right

flatten : Tree a -> List a
flatten tree =
  case tree of
    Empty -> []
    Node v left right ->
      [v] ++ flatten left ++ flatten right

isElement : a -> Tree a -> Bool
isElement element tree =
  case tree of
    Empty -> False
    Node v left right ->
      v == element
      || isElement element left
      || isElement element right

fold : (a -> b -> b) -> b -> Tree a -> b

fold f start tree =
  case tree of
    Empty -> start
    Node v left right ->
      (fold f (f v (fold f start right)) left)

main : Element
main =
  flow down
  [ display "depth" depth t1
  , display "depth" depth t2
  , display "map ((+)1)" (map ((+)1)) t2
  , display "sum" sum t1
  , display "sum" sum t2
  , display "flatten" flatten t1
  , display "flatten" flatten t2
  , display "isElement 1 t1" (isElement 1) t1
  , display "isElement 4 t1" (isElement 4) t1
  , display "fold (+) 0 t1"  (fold (+) 0) t1
  , display "fold (::) [] t1" (fold (::) []) t1
  ]

display : String -> (Tree a -> b) -> Tree a -> Element
display name f value =
  name ++ " (" ++ toString value ++ ") &rArr;\n    " ++ toString (f value) ++ "\n"
    |> Text.fromString
    |> Text.monospace
    |> leftAligned
