{-# LANGUAGE OverloadedStrings #-}
module BlogApp.Query where
import Database.SQLite.Simple
import Data.Text (Text)
import BlogApp.Types (User)

insertUser :: Text -> Text -> Text -> IO ()
insertUser userName userEmail userPassword = do
    conn <- open "./blogAppDB"
    execute conn "insert into users (user_name, user_email, user_password) values (?,?,?)" (userName, userEmail, userPassword)
    close conn

fetchUserByEmail :: Text -> IO [User]
fetchUserByEmail email = do
    conn <- open "./blogAppDB"
    userList <- query conn "select * from users where user_email = ?" (Only email) :: IO [User]
    close conn
    pure userList
