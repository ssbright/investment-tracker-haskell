
main :: IO ()
main = do

    putStrLn "Open data!"
    putStrLn "Please enter new investmentin the format of: MM/DD/YYY,[BTC_Amount],[BTC_Price]"
    input <-getLine
    appendFile "investment.csv" "\n"
    appendFile "investment.csv" input 