module Main exposing (..)

-- Press buttons to increment and decrement a counter.
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/buttons.html
--


import Browser
import Html exposing (Html, button, div, text, nav, a, i, node, span, ul, li)
import Html.Attributes exposing (class, href, rel, src)



-- MAIN


main : Program () Model Msg
main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL


script : String -> Html msg
script url =
    node "script"
        [ src url
        ]
        []


stylesheet : String -> Html msg
stylesheet url =
    node "link"
        [ rel "stylesheet"
        , href url
        -- , integrity "sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
        -- , crossorigin "anonymous"
        ]
        []


{-| [Bootstrap 3](http://getbootstrap.com/)
-}
bootstrap :
    { css : Html msg
    , theme : Html msg
    , js : Html msg
    , icons: Html msg
    }
bootstrap =
    { css = stylesheet "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    , theme = stylesheet "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    , js = script "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    , icons = stylesheet "https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
    }


type alias Model = Int


init : Model
init =
  0



-- UPDATE


type Msg
  = Increment
  | Decrement


update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1



-- VIEW

navbar : Html Msg
navbar = nav [ class "navbar navbar-expand-lg bg-body-tertiary" ] [
    div [ class "container-fluid" ] [
      div [ class "d-flex align-items-center" ] [
          a [
            href "https://pantunis.com/"
            , class "navbar-brand mb-3 me-2 mb-md-0 text-decoration-none lh-1"
          ] [
            i [ class "bi bi-p-square-fill" ] []
          ]
      ]
      , button [
        class "navbar-toggler"
        -- , type "button"
        -- , data-bs-toggle "collapse"
        -- , data-bs-target "#navbarSupportedContent"
        -- , aria-controls "navbarSupportedContent"
        -- , aria-expanded "false"
        -- , aria-label "Toggle navigation"
      ] [
        span [ class "navbar-toggler-icon" ] []
      ]
      , div [
        class "collapse navbar-collapse"
      ] [
        ul [
          class "navbar-nav me-auto mb-2 mb-lg-0"
        ] [
          li [ class "nav-item" ] [
            a [ class "nav-link", href "https://pantunis.com" ] [
              i [ class "bi bi-house" ] []
              , text " "
              , text "Halaman Utama"
            ]
          ]
          , li [ class "nav-item" ] [
            a [ class "nav-link", href "https://pantunis.com" ] [
              i [ class "bi bi-bullseye" ] []
              , text " "
              , text "CKT"
            ]
          ]
          , li [ class "nav-item" ] [
            a [ class "nav-link", href "https://pantunis.com" ] [
              i [ class "bi bi-compass" ] []
              , text " "
              , text "Teroka"
            ]
          ]
          , li [ class "nav-item" ] [
            a [ class "nav-link", href "https://pantunis.com" ] [
              i [ class "bi bi-book" ] []
              , text " "
              , text "Sumber"
            ]
          ]
          , li [ class "nav-item" ] [
            a [ class "nav-link", href "https://pantunis.com" ] [
              i [ class "bi bi-info-square" ] []
              , text " "
              , text "Pantunis"
            ]
          ]
        ]
      ]
    ]
  ]


main_ : Html Msg
main_ = div [] [
    text "Main"
  ]


view : Model -> Html Msg
view model =
  div []
    [ bootstrap.css
      , bootstrap.icons
      , navbar
      , main_
      , bootstrap.js
  ]