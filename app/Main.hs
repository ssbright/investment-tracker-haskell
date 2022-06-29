{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveDataTypeable #-}

module Main where


import Network.HTTP.Req
import Control.Monad.IO.Class 
import qualified Data.ByteString.Char8 as B
import Data.Text (Text)
import Data.Aeson
import Data.Maybe
import Data.Dates
import Control.Monad 
import qualified Data.Vector as V





import Request (getRequest)
import Csv 

testTable :: [([Char], Int, Int)]
testTable = [("5/11/96", 1, 100), ("5/11/96", 2, 200)]

{-- 
calcCurrValue :: Int -> Invest -> Int 
calcCurrValue p [] = 0
calcCurrValue p (Invest date amt price) = (read amt :: Int ) * p 
calcCurrValue p (Invest date amt price:xs) = ((read amt :: Int ) * p)  + calcCurrValue p xs
--}

showDetails' :: Invest -> String
showDetails'(Invest date amt price) = "On the date of " ++ date  ++ ", you purchased " ++  amt ++ " Bitcoin worth $" ++ price ++ ". " ++ "\n"







main :: IO ()
main = do 

    request <- getRequest
    table <- csv
    let table' = V.toList table 

--    let
--        value = map calcCurrValue $ 1000 table'
--        valueString =  "Your current portfolio value is " ++ show value 
    putStrLn . concat . map showDetails' $ table'
--    putStrLn valueString
    print table'
    print 7
    putStrLn request 


