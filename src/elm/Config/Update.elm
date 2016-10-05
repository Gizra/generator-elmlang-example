module Config.Update exposing (..)

import Config exposing (backends)
import Config.Model exposing (emptyModel, Model)
import Task exposing (map)


init : ( Model, Cmd Msg )
init =
    emptyModel ! [ getConfigFromUrl ]


type Msg
    = SetConfig Config.Model.BackendConfig
    | SetError


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetConfig backendConfig ->
            { model | backendConfig = backendConfig } ! []

        SetError ->
            { model | error = True } ! []



-- EFFECTS


getConfigFromUrl : Cmd Msg
getConfigFromUrl =
    let
        getAction location =
            let
                config =
                    List.filter (\backend -> backend.hostname == location.hostname) backends
                        |> List.head
            in
                case config of
                    Just val ->
                        SetConfig val

                    Nothing ->
                        SetError

        actionTask =
            Task.map getAction WebAPI.Location.location
    in
        Effects.task actionTask
