module App exposing (..) 

import Html exposing (..)
import Html.Attributes exposing (..)

main =
  div [ class "container" ]
    [ div [ class "page-header" ]
      [ h1 [] [ text "Header" ]
      ]
    , p [] [ text "Hello from Elm" ]
    ]

