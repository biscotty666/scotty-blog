{-# LANGUAGE DeriveAnyClass #-}
module BlogApp.Types where
import Data.Text (Text)
import Database.SQLite.Simple (FromRow)
import GHC.Generics (Generic)

data User = User {
    userId :: Int
  , userName :: Text
  , userEmail :: Text
  , userPassword :: Text
} deriving (Eq, Show, FromRow, Generic)
