module IsDateInDateRange
    ( 
        getRepeatedDays,
    ) where

import Dates

-- Todo: chatGPT gave this based on the javascript version, but it is not right. make it more like you want it.
-- Function to get repeated days based on the given parameters
getRepeatedDays :: (Day, TimeOfDay, Day, Day, TimeOfDay) -> Integer -> Integer -> (Bool, Int, [Day])
getRepeatedDays commonArgs missingIntervalValue repeatIntervalValue
    | missingIntervalValue /= 0 = (False, 0, [])
    | eventObTime <= startTime = 
        let moduloStart = daysDiff (eventObDate, startDate) `mod` repeatIntervalValue
            inverseModuloStart = repeatIntervalValue - moduloStart
            moduloDiff = if moduloStart == 0 then daysDiff (startDate, endDate) else daysDiff (startDate, endDate) - inverseModuloStart
        in if moduloDiff < 0
            then (False, 0, [])
            else let occurrences = fromIntegral (moduloDiff `div` repeatIntervalValue) + 1
                     firstOccurranceDate = if moduloStart == 0 then startDate else addDaysToDate startDate inverseModuloStart
                     datesRepeated = take (fromIntegral occurrences) $ iterate (\date -> addDaysToDate date repeatIntervalValue) firstOccurranceDate
                 in (True, occurrences, datesRepeated)
    | otherwise = 
        let eventObDateDiff = daysDiff (startDate, endDate) - daysDiff (startDate, eventObDate)
            occurrences = fromIntegral (eventObDateDiff `div` repeatIntervalValue) + 1
            datesRepeated = take (fromIntegral occurrences) $ iterate (\date -> addDaysToDate date repeatIntervalValue) eventObDate
        in (True, occurrences, datesRepeated)

-- Sample usage:
-- getRepeatedDays (eventObDate, eventObTime, startDate, endDate, startTime) missingIntervalValue repeatIntervalValue