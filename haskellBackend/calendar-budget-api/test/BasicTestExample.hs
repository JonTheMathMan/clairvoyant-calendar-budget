module BasicTestExample
    ( basicTestResult
    ) where

import Lib

-- How To Avoid Using hunit because I am a noob and don't want to deal with packages yet

basicTestArgs :: [(String, Int, Int, Int, Int)]
basicTestArgs = [("smaller", 3, 4, 5, 7), ("bigger", 22, 12, 64, 20)]

basicTestCaseCheck :: (String, Int, Int, Int, Int) -> (String, Int, Int, Bool)
basicTestCaseCheck (name, x, y, z, expected) = (name, expected, simpleMathFunction x y z, (simpleMathFunction x y z) == expected)

basicTestList :: [(String, Int, Int, Int, Int)] -> [(String, Int, Int, Bool)]
basicTestList xs = [x2 | x2 <- [basicTestCaseCheck x | x <- xs], frth x2 == False]

frth (_, _, _, x) = x

basicTestResult = basicTestList basicTestArgs

