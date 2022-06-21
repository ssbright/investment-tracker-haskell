{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where


import Network.HTTP.Req
import Control.Monad.IO.Class 
import qualified Data.ByteString.Char8 as B
import Data.Text (Text)


key = "52d05ce777a763111edccdf2a02fce3b7f406a3a"
keyAndSet = "ticker?key=52d05ce777a763111edccdf2a02fce3b7f406a3a&ids=BTC,ETH,XRP&interval=1d,30d&convert=EUR&platform-currency=ETH&per-page=100&page=1"
ticker = "ticker?key="
set = "&ids=BTC,ETH,XRP&interval=1d,30d&convert=EUR&platform-currency=ETH&per-page=100&page=1"
key2 = ticker ++ key ++ set 
url = ""
--https://api.nomics.com/v1/currencies/ticker?key=52d05ce777a763111edccdf2a02fce3b7f406a3a&ids=BTC,ETH,XRP&interval=1d,30d&convert=EUR&platform-currency=ETH&per-page=100&page=1



main :: IO ()
main = runReq defaultHttpConfig $ do
    bs <- req GET (https "api.nomics.com" /: "v1/currencies/ticker") NoReqBody bsResponse $
        "key" =: ("52d05ce777a763111edccdf2a02fce3b7f406a3a" :: Text) <>
        "ids" =: ("BTC,ETH,XRP" :: Text)                              <>
        "interval" =: ("1d,30d" :: Text)                              <>
        "convert" =: ("EUR" :: Text)                                  <>
        "platform-currency" =: ("ETH" :: Text)                        <>
        "per-page" =: ("100" :: Text)                                 <>
        "page" =: ("1" :: Text) 
    
    liftIO $ B.putStrLn (responseBody bs)

