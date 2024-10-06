module Main where

import Dates

-- main :: (Int, Int, Int) -> Int -> (Int, Int, Int)
main :: IO ()
main = run

run :: IO ()
run = print (julianDateInverse (2024, 5, 15))