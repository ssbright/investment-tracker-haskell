{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}

module Request where


import Network.HTTP.Req
import Control.Monad.IO.Class 
import qualified Data.ByteString.Char8 as B
import Data.Text (Text)
import Data.Aeson
import Data.Maybe
import Data.Dates
import Control.Monad 



--https://api.coingecko.com/api/v3/simple/price?ids=Bitcoin&vs_currencies=USD

getRequest :: IO Int
getRequest = runReq defaultHttpConfig $ do
    bs <- req GET (https "api.coingecko.com" /: "api" /: "v3" /: "simple" /: "price") NoReqBody bsResponse $
        "ids" =: ("Bitcoin" :: Text)                                  <>
        "vs_currencies" =: ("USD" :: Text)                
    let 
        price = 7
            --liftIO $ B.putStrLn . B.drop 18 $ (responseBody bs)
    return 7

