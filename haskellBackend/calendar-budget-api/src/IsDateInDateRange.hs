module IsDateInDateRange
    ( 
        getRepeatedDays,
        getRepeatedMonths,
    ) where

import Dates

getRepeatedDays :: (Int, Int, Int) -> (Int, Int, Int) -> (Int, Int, Int) -> Int -> (Bool, Int, [(Int, Int, Int)])
getRepeatedDays eventDate windowStart windowEnd repeatIntervalInDays
    | repeatIntervalInDays < 1 = (False, 0, [])
    | (daysDiff windowStart eventDate) < 0 = 
        let moduloStart = (daysDiff eventDate windowStart) `mod` repeatIntervalInDays
            inverseModuloStart = repeatIntervalInDays - moduloStart
            moduloDiff = if moduloStart == 0 then (daysDiff windowStart windowEnd) else (daysDiff windowStart windowEnd) - inverseModuloStart
        in if moduloDiff < 0
            then (False, 0, [])
            else let occurrences = fromIntegral (moduloDiff `div` repeatIntervalInDays) + 1
                     firstOccurranceDate = if moduloStart == 0 then windowStart else addDay windowStart inverseModuloStart
                     datesRepeated = take (fromIntegral occurrences) $ iterate (\date -> addDay date repeatIntervalInDays) firstOccurranceDate
                 in (True, occurrences, datesRepeated)
    | otherwise = 
        let eventDateDiff = (daysDiff windowStart windowEnd) - (daysDiff windowStart eventDate)
            occurrences = fromIntegral (eventDateDiff `div` repeatIntervalInDays) + 1
            datesRepeated = take (fromIntegral occurrences) $ iterate (\date -> addDay date repeatIntervalInDays) eventDate
        in if eventDateDiff < 1
            then (False, 0, [])
            else (True, occurrences, datesRepeated)

getRepeatedMonths :: (Int, Int, Int) -> (Int, Int, Int) -> (Int, Int, Int) -> Int -> (Bool, Int, [(Int, Int, Int)])
getRepeatedMonths eventDate windowStart windowEnd repeatIntervalInMonths
    | repeatIntervalInMonths < 1 = (False, 0, [])
    | (monthsDiff windowStart eventDate) < 0 =
        let moduloStart = (monthsDiff eventDate windowStart) `mod` repeatIntervalInMonths
            inverseModuloStart = repeatIntervalInMonths - moduloStart
            moduloDiff = if moduloStart == 0 then (monthsDiff windowStart windowEnd) else (monthsDiff windowStart windowEnd) - inverseModuloStart
        in if moduloDiff < 0
            then (False, 0, [])
            else let occurrences = fromIntegral (moduloDiff `div` repeatIntervalInMonths) + 1
                     firstOccurranceDate = if moduloStart == 0 then windowStart else addMonth windowStart inverseModuloStart
                     datesRepeated = take (fromIntegral occurrences) $ iterate (\date -> addMonth date repeatIntervalInMonths) firstOccurranceDate
                 in (True, occurrences, datesRepeated)
    | otherwise =
        let eventDateDiff = (monthsDiff windowStart windowEnd) - (monthsDiff windowStart eventDate)
            occurrences = fromIntegral (eventDateDiff `div` repeatIntervalInMonths) + 1
            datesRepeated = take (fromIntegral occurrences) $ iterate (\date -> addMonth date repeatIntervalInMonths) eventDate
        in if eventDateDiff < 1
            then (False, 0, [])
            else (True, occurrences, datesRepeated)
