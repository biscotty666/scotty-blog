{-# LANGUAGE OverloadedStrings #-}
module BlogApp.Core where
import Web.Scotty
import BlogApp.HTML (registerPage)
import BlogApp.Query
import Data.Text (Text)

homeR :: ActionM ()
homeR = html "<h1>Hello there!</h1>"

registerR :: ActionM ()
registerR = html registerPage

addUserR :: ActionM ()
addUserR = do
    userName <- formParam "user_name"
    userEmail <- formParam "user_email"
    userPassword <- formParam "user_password"
    (userConfirmPassword :: Text) <- formParam "user_confirm_password"
    userList <- liftIO $ fetchUserByEmail userEmail
    case userList of
        [] -> if userPassword /= userConfirmPassword
                then text "password not matching"
                else liftIO (insertUser userName userEmail userPassword) >> redirect "/"
        _ -> text "user email already exists"

main :: IO ()
main = scotty 8080 $ do
    get "/" homeR
    get "/register" registerR
    post "/addUser" addUserR
