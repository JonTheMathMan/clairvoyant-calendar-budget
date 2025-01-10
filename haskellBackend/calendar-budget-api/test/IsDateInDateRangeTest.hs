module IsDateInDateRangeTest
    ( 
        getRepeatedDaysTestResult,
        getRepeatedMonthsTestResult,
    ) where

import Dates
import IsDateInDateRange

frth (_, _, _, x) = x

-- Test arguments for getRepeatedDays
getRepeatedDaysTestArgs :: [(String, (Int, Int, Int), (Int, Int, Int), (Int, Int, Int), Int, (Bool, Int, [(Int, Int, Int)]))]
getRepeatedDaysTestArgs = [
    -- Event Date Before Search Window
    ("beforeWindow1", (2023, 12, 1), (2023, 12, 10), (2023, 12, 20), 1, 
        (True, 11, [(2023, 12, 10), (2023, 12, 11), (2023, 12, 12), (2023, 12, 13), (2023, 12, 14), (2023, 12, 15), 
                    (2023, 12, 16), (2023, 12, 17), (2023, 12, 18), (2023, 12, 19), (2023, 12, 20)])),
    ("beforeWindow3", (2023, 12, 1), (2023, 12, 10), (2023, 12, 20), 3, 
        (True, 4, [(2023, 12, 10), (2023, 12, 13), (2023, 12, 16), (2023, 12, 19)])),
    ("beforeWindow7", (2023, 12, 1), (2023, 12, 10), (2023, 12, 20), 7, 
        (True, 1, [ (2023, 12, 15)])),

    -- Event Date During Search Window
    ("duringWindow1", (2023, 12, 12), (2023, 12, 10), (2023, 12, 20), 1, 
        (True, 9, [(2023, 12, 12), (2023, 12, 13), (2023, 12, 14), (2023, 12, 15), (2023, 12, 16), (2023, 12, 17), 
                    (2023, 12, 18), (2023, 12, 19), (2023, 12, 20)])),
    ("duringWindow3", (2023, 12, 12), (2023, 12, 10), (2023, 12, 20), 3, 
        (True, 3, [(2023, 12, 12), (2023, 12, 15), (2023, 12, 18)])),
    ("duringWindow7", (2023, 12, 12), (2023, 12, 10), (2023, 12, 20), 7, 
        (True, 2, [(2023, 12, 12), (2023, 12, 19)])),

    -- Event Date After Search Window
    ("afterWindow1", (2023, 12, 25), (2023, 12, 10), (2023, 12, 20), 1, (False, 0, [])),
    ("afterWindow3", (2023, 12, 25), (2023, 12, 10), (2023, 12, 20), 3, (False, 0, [])),
    ("afterWindow7", (2023, 12, 25), (2023, 12, 10), (2023, 12, 20), 7, (False, 0, []))
    ]

-- Function to test a single test case
getRepeatedDaysTestCaseCheck :: (String, (Int, Int, Int), (Int, Int, Int), (Int, Int, Int), Int, (Bool, Int, [(Int, Int, Int)]))
                               -> (String, (Bool, Int, [(Int, Int, Int)]), (Bool, Int, [(Int, Int, Int)]), Bool)
getRepeatedDaysTestCaseCheck (name, eventDate, windowStart, windowEnd, repeatInterval, expected) = 
    (name, expected, getRepeatedDays eventDate windowStart windowEnd repeatInterval, getRepeatedDays eventDate windowStart windowEnd repeatInterval == expected)

getRepeatedDaysTestList :: [(String, (Int, Int, Int), (Int, Int, Int), (Int, Int, Int), Int, (Bool, Int, [(Int, Int, Int)]))] -> [(String, (Bool, Int, [(Int, Int, Int)]), (Bool, Int, [(Int, Int, Int)]), Bool)]
getRepeatedDaysTestList xs = [x2 | x2 <- [getRepeatedDaysTestCaseCheck x | x <- xs], not(frth x2)]

-- Run all test cases
getRepeatedDaysTestResult :: [(String, (Bool, Int, [(Int, Int, Int)]), (Bool, Int, [(Int, Int, Int)]), Bool)]
getRepeatedDaysTestResult = getRepeatedDaysTestList getRepeatedDaysTestArgs

getRepeatedMonthsTestArgs :: [(String, (Int, Int, Int), (Int, Int, Int), (Int, Int, Int), Int, (Bool, Int, [(Int, Int, Int)]))]
getRepeatedMonthsTestArgs = [
    -- Event Date Before Search Window
    ("beforeWindow1", (2023, 1, 1), (2023, 4, 1), (2023, 10, 1), 1, 
        (True, 7, [(2023, 4, 1), (2023, 5, 1), (2023, 6, 1), (2023, 7, 1), (2023, 8, 1), (2023, 9, 1), (2023, 10, 1)])),
    ("beforeWindow3", (2023, 1, 1), (2023, 4, 1), (2023, 10, 1), 3, 
        (True, 3, [(2023, 4, 1), (2023, 7, 1), (2023, 10, 1)])),
    ("beforeWindow6", (2023, 1, 1), (2023, 4, 1), (2023, 10, 1), 6, 
        (True, 1, [(2023, 7, 1)])),

    -- Event Date During Search Window
    ("duringWindow1", (2023, 6, 1), (2023, 4, 1), (2023, 10, 1), 1, 
        (True, 5, [(2023, 6, 1), (2023, 7, 1), (2023, 8, 1), (2023, 9, 1), (2023, 10, 1)])),
    ("duringWindow3", (2023, 6, 1), (2023, 4, 1), (2023, 10, 1), 3, 
        (True, 2, [(2023, 6, 1), (2023, 9, 1)])),
    ("duringWindow6", (2023, 6, 1), (2023, 4, 1), (2023, 10, 1), 6, 
        (True, 1, [(2023, 6, 1)])),

    -- Event Date After Search Window
    ("afterWindow1", (2023, 12, 1), (2023, 4, 1), (2023, 10, 1), 1, (False, 0, [])),
    ("afterWindow3", (2023, 12, 1), (2023, 4, 1), (2023, 10, 1), 3, (False, 0, [])),
    ("afterWindow6", (2023, 12, 1), (2023, 4, 1), (2023, 10, 1), 6, (False, 0, []))
    ]

-- Function to test a single test case
getRepeatedMonthsTestCaseCheck :: (String, (Int, Int, Int), (Int, Int, Int), (Int, Int, Int), Int, (Bool, Int, [(Int, Int, Int)]))
                               -> (String, (Bool, Int, [(Int, Int, Int)]), (Bool, Int, [(Int, Int, Int)]), Bool)
getRepeatedMonthsTestCaseCheck (name, eventDate, windowStart, windowEnd, repeatInterval, expected) = 
    (name, expected, getRepeatedMonths eventDate windowStart windowEnd repeatInterval, getRepeatedMonths eventDate windowStart windowEnd repeatInterval == expected)

getRepeatedMonthsTestList :: [(String, (Int, Int, Int), (Int, Int, Int), (Int, Int, Int), Int, (Bool, Int, [(Int, Int, Int)]))] -> [(String, (Bool, Int, [(Int, Int, Int)]), (Bool, Int, [(Int, Int, Int)]), Bool)]
getRepeatedMonthsTestList xs = [x2 | x2 <- [getRepeatedMonthsTestCaseCheck x | x <- xs], not(frth x2)]

-- Run all test cases
getRepeatedMonthsTestResult :: [(String, (Bool, Int, [(Int, Int, Int)]), (Bool, Int, [(Int, Int, Int)]), Bool)]
getRepeatedMonthsTestResult = getRepeatedMonthsTestList getRepeatedMonthsTestArgs

