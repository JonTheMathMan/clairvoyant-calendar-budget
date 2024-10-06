module DatesTest
    ( getMonthLengthTestResult,
    addMonthTestResult,
    addDayTestResult,
    daysDiffTestResult
    ) where

import Dates

frth (_, _, _, x) = x

getMonthLengthTestArgs :: [(String, (Int, Int, Int), Int)]
getMonthLengthTestArgs = [
    ("januaryTest", (2020, 01, 01), 31),
    ("februaryTest", (2017, 02, 01), 28),
    ("februaryLeapTest", (2020, 02, 01), 29),
    ("marchTest", (2020, 03, 01), 31),
    ("aprilTest", (2020, 04, 01), 30),
    ("mayTest", (2020, 05, 01), 31),
    ("juneTest", (2020, 06, 01), 30),
    ("julyTest", (2020, 07, 01), 31),
    ("augustTest", (2020, 08, 01), 31),
    ("septemberTest", (2020, 09, 01), 30),
    ("octoberTest", (2020, 10, 01), 31),
    ("novemberTest", (2020, 11, 01), 30),
    ("decemberTest", (2020, 12, 01), 31),
    ("decemberZeroTest", (2020, 0, 01), 31)]

getMonthLengthTestCaseCheck :: (String, (Int, Int, Int), Int) -> (String, Int, Int, Bool)
getMonthLengthTestCaseCheck (name, date, expected) = (name, expected, getMonthLength date, getMonthLength date == expected)

getMonthLengthTestList :: [(String, (Int, Int, Int), Int)] -> [(String, Int, Int, Bool)]
getMonthLengthTestList xs = [x2 | x2 <- [getMonthLengthTestCaseCheck x | x <- xs], not(frth x2)]

getMonthLengthTestResult = getMonthLengthTestList getMonthLengthTestArgs

addMonthTestArgs :: [(String, (Int, Int, Int), Int, (Int, Int, Int))]
addMonthTestArgs = [
    ("addOneMonth", (2020, 05, 15), 1, (2020, 06, 15)),
    ("addSixMonths", (2020, 01, 15), 6, (2020, 07, 15)),
    ("addSixMonthsYear", (2020, 09, 15), 6, (2021, 03, 15)),
    ("add18Months", (2019, 09, 15), 18, (2021, 03, 15)),
    ("zeroithMonth", (2019, 01, 15), -1, (2018, 12, 15)),
    ("negativeMonthsSingleYear", (2019, 09, 15), -6, (2019, 03, 15)),
    ("negativeMonths", (2019, 09, 15), -18, (2018, 03, 15)),
    ("negativeMonthsYears", (2019, 09, 15), -28, (2017, 05, 15))]

addMonthTestCaseCheck :: (String, (Int, Int, Int), Int, (Int, Int, Int)) -> (String, (Int, Int, Int), (Int, Int, Int), Bool)
addMonthTestCaseCheck (name, date, increase, expected) = (name, expected, addMonth date increase, addMonth date increase == expected)

addMonthTestList :: [(String, (Int, Int, Int), Int, (Int, Int, Int))] -> [(String, (Int, Int, Int), (Int, Int, Int), Bool)]
addMonthTestList xs = [x2 | x2 <- [addMonthTestCaseCheck x | x <- xs], not(frth x2)]

addMonthTestResult = addMonthTestList addMonthTestArgs


addDayTestArgs :: [(String, (Int, Int, Int), Int, (Int, Int, Int))]
addDayTestArgs = [
    ("addTwoWeeks", (2020, 05, 15), 14, (2020, 05, 29)),
    ("addDaysMonthCrossing", (2020, 01, 25), 10, (2020, 02, 04)),
    ("addDaysMonthCrossing2", (2020, 02, 25), 10, (2020, 03, 06)),
    ("add3Months", (2019, 12, 31), 90, (2020, 03, 30)),
    ("add1YearJump", (2020, 09, 15), 300, (2021, 07, 12)),
    ("add2YearJump", (2020, 09, 15), 500, (2022, 01, 28)),
    ("negagiveTwoWeeks", (2020, 05, 29),-14, (2020, 05, 15)),
    ("negative3Months", (2020, 03, 30), -90, (2019, 12, 31)),
    ("negative1YearJump", (2021, 07, 12), -300, (2020, 09, 15)),
    ("negative2YearJump", (2022, 01, 28), -500, (2020, 09, 15))]

addDayTestCaseCheck :: (String, (Int, Int, Int), Int, (Int, Int, Int)) -> (String, (Int, Int, Int), (Int, Int, Int), Bool)
addDayTestCaseCheck (name, date, increase, expected) = (name, expected, addDay date increase, addDay date increase == expected)

addDayTestList :: [(String, (Int, Int, Int), Int, (Int, Int, Int))] -> [(String, (Int, Int, Int), (Int, Int, Int), Bool)]
addDayTestList xs = [x2 | x2 <- [addDayTestCaseCheck x | x <- xs], not(frth x2)]

addDayTestResult = addDayTestList addDayTestArgs

daysDiffTestArgs :: [(String, (Int, Int, Int),(Int, Int, Int), Int)]
daysDiffTestArgs = [
    ("addTwoWeeks", (2020, 05, 15), (2020, 05, 29), 14),
    ("daysDiffsMonthCrossing", (2020, 01, 25), (2020, 02, 04), 10),
    ("daysDiffsMonthCrossing2", (2020, 02, 25), (2020, 03, 06), 10),
    ("add3Months", (2019, 12, 31), (2020, 03, 30), 90),
    ("add1YearJump", (2020, 09, 15), (2021, 07, 12), 300),
    ("add2YearJump", (2020, 09, 15), (2022, 01, 28), 500),
    ("negagiveTwoWeeks", (2020, 05, 29), (2020, 05, 15), -14),
    ("negative3Months", (2020, 03, 30), (2019, 12, 31), -90),
    ("negative1YearJump", (2021, 07, 12), (2020, 09, 15), -300),
    ("negative2YearJump", (2022, 01, 28), (2020, 09, 15), -500)]

daysDiffTestCaseCheck :: (String, (Int, Int, Int), (Int, Int, Int), Int) -> (String, Int, Int, Bool)
daysDiffTestCaseCheck (name, date, date2, expected) = (name, expected, daysDiff date date2, daysDiff date date2 == expected)

daysDiffTestList :: [(String, (Int, Int, Int), (Int, Int, Int), Int)] -> [(String, Int, Int, Bool)]
daysDiffTestList xs = [x2 | x2 <- [daysDiffTestCaseCheck x | x <- xs], not(frth x2)]

daysDiffTestResult = daysDiffTestList daysDiffTestArgs

-- chatGPT generated monthDiff. TODO: verify this is a good unit test.
monthsDiffTestArgs :: [(String, (Int, Int, Int), (Int, Int, Int), Int)]
monthsDiffTestArgs = [
    ("sameMonth", (2020, 05, 15), (2020, 05, 29), 0),
    ("monthsDiffsMonthCrossing", (2020, 01, 25), (2020, 02, 04), 1),
    ("monthsDiffsMonthCrossing2", (2020, 02, 25), (2020, 03, 06), 1),
    ("add3Months", (2019, 12, 31), (2020, 03, 30), 3),
    ("add1YearJump", (2020, 09, 15), (2021, 07, 12), 10),
    ("add2YearJump", (2020, 09, 15), (2022, 01, 28), 16),
    ("negagiveTwoWeeks", (2020, 05, 29), (2020, 05, 15), 0),
    ("negative3Months", (2020, 03, 30), (2019, 12, 31), -3),
    ("negative1YearJump", (2021, 07, 12), (2020, 09, 15), -10),
    ("negative2YearJump", (2022, 01, 28), (2020, 09, 15), -16)]

monthsDiffTestCaseCheck :: (String, (Int, Int, Int), (Int, Int, Int), Int) -> (String, Int, Int, Bool)
monthsDiffTestCaseCheck (name, date, date2, expected) = (name, expected, monthsDiff date date2, monthsDiff date date2 == expected)

monthsDiffTestList :: [(String, (Int, Int, Int), (Int, Int, Int), Int)] -> [(String, Int, Int, Bool)]
monthsDiffTestList xs = [x2 | x2 <- [monthsDiffTestCaseCheck x | x <- xs], not(frth x2)]

monthsDiffTestResult = monthsDiffTestList monthsDiffTestArgs
