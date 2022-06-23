{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where


import Network.HTTP.Req
import Control.Monad.IO.Class 
import qualified Data.ByteString.Char8 as B
import Data.Text (Text)
import Data.Aeson
import Data.Maybe



--https://api.coingecko.com/api/v3/simple/price?ids=Bitcoin&vs_currencies=USD

main :: IO ()
main = runReq defaultHttpConfig $ do
    bs <- req GET (https "api.coingecko.com" /: "api" /: "v3" /: "simple" /: "price") NoReqBody bsResponse $
        "ids" =: ("Bitcoin" :: Text)                                  <>
        "vs_currencies" =: ("USD" :: Text)                        

    liftIO $ B.putStrLn (responseBody bs)

