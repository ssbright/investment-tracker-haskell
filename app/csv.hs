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

-- file.csv
-- x,y
-- 1,2
-- 3,4

makeList xs = V.toList xs

--testTable :: [([Char], Int, Int)]
--testTable = [("5/11/96", 1, 100), ("5/11/96", 2, 200)]

csv :: IO (V.Vector Invest)
csv = do
    f <- BL.readFile "investment.csv"
    case decodeByName f of
        --Left err      -> print err
        Right (_, xs) -> return xs
            --return . V.toList $ xs
            --V.forM_ xs $ \(Invest x y z) -> return xs
    

    -- 1,2
    -- 3,4
