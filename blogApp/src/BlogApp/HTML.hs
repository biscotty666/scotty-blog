{-# LANGUAGE OverloadedStrings #-}
module BlogApp.HTML where

import Data.Text.Lazy (Text)
import Text.Blaze.Renderer.Text
import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as HA

registerPage :: Text
registerPage = renderMarkup $ do
    html $ do
        body $ do
            h1 "Register"
            H.form ! HA.method "POST" ! HA.action "/addUser" $ do
                H.label "user name"
                input ! type_ "text" ! name "user_name"
                br
                H.label "user email"
                input ! type_ "email" ! name "user_email"
                br
                H.label "password"
                input ! type_ "password" ! name "user_password"
                br
                H.label "confirm password"
                input ! type_ "password" ! name "user_confirm_password"
                br
                button ! type_ "submit" $ "register"
