module Config exposing (..)

import Config.Model as Config exposing (BackendConfig)
import Time exposing (Time)


localBackend : BackendConfig
localBackend =
    { backendUrl = "https://api.github.com"
    , name = "local"
    , hostname = "localhost"
    }


prodBackend : BackendConfig
prodBackend =
    { backendUrl = "https://api.github.com"
    , name = "gh-pages"
    , hostname = "example.com"
    }


backends : List BackendConfig
backends =
    [ localBackend
    , prodBackend
    ]


cacheTtl : Time.Time
cacheTtl =
    (5 * Time.second)
