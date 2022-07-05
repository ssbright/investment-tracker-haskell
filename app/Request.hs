{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}

module Request where


import Network.HTTP.Req
import Control.Monad.IO.Class 
import qualified Data.ByteString as BS
import qualified Data.ByteString.Char8 as B
import qualified Data.ByteString.Lazy.UTF8 as BLU
import Data.ByteString.Lazy as BL
import Data.Text (Text)
import Data.Aeson
import Data.Maybe
import Data.Dates
import Control.Monad 
import Data.Char 



--https://api.coingecko.com/api/v3/simple/price?ids=Bitcoin&vs_currencies=USD

getRequest :: IO String 
getRequest = runReq defaultHttpConfig $ do
    bs <- req GET (https "api.coingecko.com" /: "api" /: "v3" /: "simple" /: "price") NoReqBody bsResponse $
        "ids" =: ("Bitcoin" :: Text)                                  <>
        "vs_currencies" =: ("USD" :: Text)                
    let price = BLU.toString  . BL.fromStrict . B.takeWhile isNumber . B.drop 18 $ (responseBody bs) 

    return price 

