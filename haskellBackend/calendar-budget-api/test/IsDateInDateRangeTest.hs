module IsDateInDateRangeTest
    ( 
    --     getMonthLengthTestResult,
    -- addMonthTestResult,
    -- addDayTestResult
        dailyfakeloop,
        monthlyfakeloop
    ) where

import Dates

-- // IsDateRepeatInDateRange :: (String, Int, (Int, Int, Int), (Int, Int, Int), (Int, Int, Int)) -> (Bool, [(Int, Int, Int)])
-- // IsDateRepeatInDateRange (repeatType, multiplier, date, start, stop) = (true, datesFound)

baseDate :: (Int, Int, Int)
baseDate = (2019, 07, 15)

dailyRepeatTypes :: [(String, Int)]
dailyRepeatTypes = [
    ("daily", 1),
    ("weekly - every same day of the week", 7),
    ("interval - every N days", 3),
    ("interval - every N weeks", 21)]

monthlyRepeatTypes :: [(String, Int)]
monthlyRepeatTypes = [
    ("monthly - same day of the month", 1),
    ("interval - every N Months on the same day of the month", 3)]

windowTypes :: [(String, Int, Int, Bool)]
windowTypes = [
    ("after", 1, 2, True),
    ("cover", -1, 1, True),
    ("before", -2, -1, False),
    ("sameDay", 0, 0, True),
    ("start", 0, 1, True),
    ("stop", -1, 0, True),
    ("startStop", 0, 1, True)]
--     ("betweenDateAndFirstRepeat", )]

dailyfakeloop :: [(String, String, (Int, Int, Int), (Int, Int, Int), (Int, Int, Int), Bool)]
dailyfakeloop = [(x, y, baseDate, addDay baseDate (interval * startMultiplier), addDay baseDate (interval * endMultiplier), expect)  | (x, startMultiplier, endMultiplier, expect) <- windowTypes, (y, interval) <- dailyRepeatTypes]

monthlyfakeloop :: [(String, String, (Int, Int, Int), (Int, Int, Int), (Int, Int, Int), Bool)]
monthlyfakeloop = [(x, y, baseDate, addMonth baseDate (interval * startMultiplier), addMonth baseDate (interval * endMultiplier), expect)  | (x, startMultiplier, endMultiplier, expect) <- windowTypes, (y, interval) <- monthlyRepeatTypes]


-- IsDateRepeatInDateRangeTestCaseTypes :: [(String, Int, (Int, Int, Int))] -> [String] -> [(String, Int, (Int, Int, Int), String)]
-- IsDateRepeatInDateRangeTestCaseTypes xs ys = [(repeatType, multiplier, date, windowType) | (repeatType, multiplier, date) <- xs, windowType <- ys] 


-- IsDateRepeatInDateRangeTestCaseCheck :: (String, (Int, Int, Int), Bool) -> (String, Int, Int, Bool)
-- IsDateRepeatInDateRangeTestCaseCheck (name, date, expected) = (name, expected, IsDateRepeatInDateRange date, (IsDateRepeatInDateRange date) == expected)

-- IsDateRepeatInDateRangeTestList :: [(String, String, (Int, Int, Int), Int)] -> [(String, Int, Int, Bool)]
-- IsDateRepeatInDateRangeTestList xs = [x2 | x2 <- [IsDateRepeatInDateRangeTestCaseCheck x | x <- xs], frth x2 == False]

-- IsDateRepeatInDateRangeTestResult = IsDateRepeatInDateRangeTestList IsDateRepeatInDateRangeTestArgs