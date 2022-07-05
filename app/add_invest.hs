module Main where


import Request (getRequest)






main :: IO ()
main = do
    price <- getRequest
    putStrLn "Open data!"
    putStrLn "Please enter new investmentin the format of: MM/DD/YYY,BTC_Amount"
    input <-getLine
    appendFile "investment.csv" "\n"
    appendFile "investment.csv" input 
    appendFile "investment.csv" ", "
    appendFile "investment.csv" price 