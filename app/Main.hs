{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where


import Network.HTTP.Req
import Control.Monad.IO.Class 
import qualified Data.ByteString.Char8 as B
import Data.Text (Text)
import Data.Aeson
import Data.Maybe
import Data.Dates
import Control.Monad 

import Request (getRequest)

testTable :: [([Char], Int, Int)]
testTable = [("5/11/96", 1, 100), ("5/11/96", 2, 200)]

showDetails :: [([Char], Int, Int)] -> String
showDetails (x:xs) = case (x:xs) of [] -> "No Data in Table"
                                    [x]  ->
                                        let 
                                            (date, amt, price) = x 
                                        in 
                                            "On the date of " ++ date  ++ ", you purchased " ++ show amt ++ " Bitcoin worth $" ++ show price ++ ". "
                                    x : xs ->
                                        let 
                                            (date, amt, price) = x 
                                        in      
                                            "On the date of " ++ date  ++ ", you purchased " ++ show amt ++ " Bitcoin worth $" ++ show price ++  ". " ++ 
                                            showDetails xs

calcCurrValue :: Int -> [([Char], Int, Int)] -> Int 
calcCurrValue p (x:xs) = case (x:xs) of [] -> 0
                                        [x]  ->
                                            let 
                                                (_, amt, _) = x 
                                            in 
                                                amt * p 
                                        x : xs ->
                                            let 
                                                (date, amt, price) = x 
                                            in      
                                                (amt * p)  +
                                                calcCurrValue p xs

--addToTracker :: (DateTime, Int, Int) -> (DateTime, Int, Int)
--addToTracker d amt p [ds, amts, ps] =  [(d, amt, p) : (ds, amts, ps)]

main :: IO ()
main = do 
    getRequest
    let
        value = calcCurrValue 1000 testTable
        valueString =  "Your current portfolio value is " ++ show value 
    putStrLn $ showDetails testTable
    putStrLn valueString
