{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveDataTypeable #-}

module Main where
import qualified Data.Vector as V

--Local Imports 
import Request (getRequest)
import Csv 

testTable :: [([Char], Int, Int)]
testTable = [("5/11/96", 1, 100), ("5/11/96", 2, 200)]


calcCurrValue :: Float -> [Invest] -> Float
calcCurrValue _ [] = 0
calcCurrValue p [Invest _ amt _] = (read amt :: Float ) * p 
calcCurrValue p (Invest _ amt _:xs) = ((read amt :: Float ) * p)  + calcCurrValue p xs


showDetails' :: Invest -> String
showDetails'(Invest date amt price) = "On the date of " ++ date  ++ ", you purchased " ++  amt ++ " Bitcoin worth $" ++ price ++ ". " ++ "\n"







main :: IO ()
main = do 

    price <- getRequest
    table <- csv
    let table' = V.toList table 
        value = calcCurrValue (read price :: Float) table'
        valueString =  "Your current portfolio value is " ++ show value 
    putStrLn . concat . map showDetails' $ table'
    putStrLn valueString


 



