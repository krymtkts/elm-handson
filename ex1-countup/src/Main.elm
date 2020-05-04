module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (Html, button, div, p, text)
import Html.Events exposing (onClick)



-- main : The Elm Architecture に必要な関数をセットする


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }



-- Model : アプリケーションの状態を Model 型として定義する


type alias Model =
    { count : Int
    }



-- init : モデルの初期状態を与える


init : Model
init =
    { count = 0
    }



-- Msg : アプリケーション内で発生するアクションを定義


type Msg
    = Increment
    | Decrement
    | Reset



-- update : アクション(Msg)が発生したときに、現在のモデルから新しいモデルを作る関数


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | count = model.count + 1 }

        Decrement ->
            case model.count of
                0 ->
                    model

                _ ->
                    { model | count = model.count - 1 }

        Reset ->
            { model | count = 0 }



-- view : 現在のモデルをHTMLで表現する関数


view : Model -> Html Msg
view model =
    div []
        [ p [] [ text <| String.fromInt model.count ]
        , button [ onClick Increment ] [ text "+1" ]
        , button [ onClick Decrement ] [ text "-1" ]
        , button [ onClick Reset ] [ text "reset" ]
        ]
