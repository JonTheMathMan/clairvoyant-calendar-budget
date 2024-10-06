module Dates
    ( 
        getMonthLength,
        addMonth,
        addDay,
        julianDate,
        julianDateInverse,
        daysDiff
    ) where

-- data CalendarDate = CalendarDate
--             { year :: Int
--             , month :: Int
--             , day :: Int
--             }

getMonthLength :: (Int, Int, Int) -> Int
getMonthLength (year, 4, _) = 30
getMonthLength (year, 6, _) = 30
getMonthLength (year, 9, _) = 30
getMonthLength (year, 11, _) = 30
getMonthLength (year, 2, _) = if year `mod` 4 == 0 then 29 else 28
getMonthLength (year, month, _) = 31

addMonth :: (Int, Int, Int) -> Int -> (Int, Int, Int)
addMonth (year, month, day) nMonths = if aboveYear || belowYear
    then (year + changeYears, zeroToUnsignedTwelve modMonths, day)
    else (year, month+nMonths, day)
    where aboveYear = month + nMonths > 12
          belowYear = month + nMonths <= 0
          changeYears = floor (fromIntegral (zeroToSignedTwelve (month+nMonths))/12.0)
          modMonths = (month+nMonths) `mod` 12
          zeroToUnsignedTwelve x = if x == 0 then 12 else x
          zeroToSignedTwelve x = if x == 0 && belowYear then -12 else if x == 0 then 12 else x

addDay :: (Int, Int, Int) -> Int -> (Int, Int, Int)
addDay (year, month, day) 0 = (year, month, day)

addDay (year, month, day) nDays = if (nDays + day) > getMonthLength (year, month, 0)
    then addDay (addMonth (year, month, day) 1) (nDays - getMonthLength (year, month, 0))
    else if (nDays + day) <= 0
    then addDay (addMonth (year, month, day) (-1)) (nDays + (getMonthLength (addMonth (year, month, day) (-1))))
    else (year, month, day + nDays)

-- // IsDateRepeatInDateRange :: (String, Int, (Int, Int, Int), (Int, Int, Int), (Int, Int, Int)) -> (Bool, [(Int, Int, Int)])
-- // IsDateRepeatInDateRange (repeatType, multiplier, date, start, stop) = (true, datesFound)

midYears :: (Int, Int, Int) -> (Int, Int, Int) -> Int
midYears (year, month, day) (year2, month2, day2) = sum [1 | x <- [year..year2], x `mod` 4 == 0] + (year2-year) * 365 

julianDate :: (Int, Int, Int) -> Int
julianDate (year, month, day) = sum [getMonthLength (year, x, day) | x <- [1..month-1]] + day 

julianDateInverse :: (Int, Int, Int) -> Int
julianDateInverse (year, month, day) = sum [getMonthLength (year, x, day) | x <- [month..12]] - day 

daysDiff :: (Int, Int, Int) -> (Int, Int, Int) -> Int
daysDiff (year, month, day) (year2, month2, day2) = if year2 - year > 1
    then julianDateInverse (year, month, day) + midYears (year +1, month, day) (year2 -1, month2, day2) + julianDate (year2, month2, day2)
    else if year2 - year == 1
    then julianDateInverse (year, month, day) + julianDate (year2, month2, day2)
    else julianDate (year2, month2, day2) - julianDate (year, month, day)

-- chatGPT generated monthsDiff. TODO: make sure unit test for this is good and this passes
monthsDiff :: (Int, Int, Int) -> (Int, Int, Int) -> Int
monthsDiff (y1, m1, d1) (y2, m2, d2)
    | y2 > y1 || (y2 == y1 && m2 > m1) || (y2 == y1 && m2 == m1 && d2 >= d1) = (y2 - y1) * 12 + (m2 - m1)
    | otherwise = (y2 - y1) * 12 + (m2 - m1) - 1