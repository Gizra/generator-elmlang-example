module Config.Model exposing (..)


type alias BackendConfig =
    { backendUrl : String
    , name :
        String
        -- Url information
    , hostname : String
    }


initialBackendConfig : BackendConfig
initialBackendConfig =
    { backendUrl = ""
    , name = ""
    , hostname = ""
    }


type alias Model =
    { backendConfig : BackendConfig
    , error : Bool
    }


emptyModel : Model
emptyModel =
    { backendConfig = initialBackendConfig
    , error = False
    }
