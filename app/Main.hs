{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where


import Network.HTTP.Req
import Control.Monad.IO.Class 

main :: IO ()
main = runReq defaultHttpConfig $ do
    bs <- req GET (https "api.coinbase.com/v2/prices/spot?currency=USD" ) NoReqBody bsResponse mempty
    liftIO $ putStrLn (responseBody bs)