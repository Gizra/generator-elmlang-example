module App.Model exposing (emptyModel, Model, Page(..))

import Exts.RemoteData exposing (RemoteData(..), WebData)
import User.Model exposing (..)
import Pages.Counter.Model exposing (emptyModel, Model)
import Pages.Login.Model exposing (emptyModel, Model)


type Page
    = AccessDenied
    | Counter
    | Login
    | MyAccount
    | PageNotFound


type alias Model =
    { activePage : Page
    , pageCounter : Pages.Counter.Model.Model
    , pageLogin : Pages.Login.Model.Model
    , user : WebData User
    }


emptyModel : Model
emptyModel =
    { activePage = Counter
    , pageCounter = Pages.Counter.Model.emptyModel
    , pageLogin = Pages.Login.Model.emptyModel
    , user = NotAsked
    }
