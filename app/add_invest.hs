
main :: IO ()
main = do

    putStrLn "Open data!"
    putStrLn "Please enter new investment"
    input <-getLine
    appendFile "investment.csv" input 