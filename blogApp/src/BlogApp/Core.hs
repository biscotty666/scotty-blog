{-# LANGUAGE OverloadedStrings #-}
module BlogApp.Core where
import Web.Scotty

main :: IO ()
main = scotty 8080 $
    get "/" $ html "<h1>Hello there!</h1>"

test :: IO ()
test = putStrLn "Hello from Core"
