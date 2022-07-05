{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE OverloadedStrings #-}

module Csv where

import qualified Data.Vector as V
import qualified Data.ByteString.Lazy as BL
import Data.Csv

data Invest =
    Invest String String String 
    deriving (Show, Eq) 

instance FromNamedRecord Invest where
    parseNamedRecord x = Invest <$> (x .: "Date") <*> (x .: "BTC") <*> (x .: "$")



makeList xs = V.toList xs



csv :: IO (V.Vector Invest)
csv = do
    f <- BL.readFile "investment.csv"
    case decodeByName f of
        Right (_, xs) -> return xs
