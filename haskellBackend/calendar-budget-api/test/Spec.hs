-- import BasicTestExample
import DatesTest
-- import IsDateInDateRangeTest

main :: IO ()
main = allTests

toString :: [Char] -> String
toString x = x

allTests :: IO ()
allTests 
    -- | length basicTestResult /= 0 = error $ show basicTestResult
    | length getMonthLengthTestResult /= 0 = error ("getMonthLength: " ++ toString (show getMonthLengthTestResult))
    | length addMonthTestResult /= 0 = error ("addMonth: " ++ toString (show addMonthTestResult))
    | length addDayTestResult /= 0 = error ("addDay: " ++ toString (show addDayTestResult))
    | length daysDiffTestResult /= 0 = error ("daysDiff: " ++ toString (show daysDiffTestResult))
    | otherwise = print "All tests passed"
    -- | otherwise =print (toString $ show (dailyfakeloop ++ monthlyfakeloop))