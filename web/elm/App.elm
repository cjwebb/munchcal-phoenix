module App exposing (..) 

import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)
import Json.Decode exposing (..)

main =
  App.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

type alias Model =
  { recipes : List Recipe
  }

type Msg = Unknown

init : (Model, Cmd Msg)
init =
  ({ recipes = [ Recipe "Spaghetti Carbonara" ] }, Cmd.none)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  ({ recipes = [] }, Cmd.none)

view : Model -> Html Msg
view model =
  div [ class "container" ]
    [ div [ class "page-header" ]
      [ h1 [] [ text "Recipes" ]
      ]
    , ul [] (List.map recipeView model.recipes)
    ]

recipeView : Recipe -> Html Msg
recipeView recipe =
  li [] [ text recipe.name ]

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

type alias Recipe =
  { name : String
  }

recipeDecoder : Decoder Recipe
recipeDecoder =
  object1 Recipe ("name" := string)

