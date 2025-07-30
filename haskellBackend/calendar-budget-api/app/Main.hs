module Main where

import IsDateInDateRange

import Data.Aeson (FromJSON, ToJSON)
import GHC.Generics (Generic)
import Network.Wai
import Network.Wai.Handler.Warp (run)
import Servant
import Data.Text (Text)

type API = "isDateInGivenRange" :> ReqBody '[JSON] RangeRequest :> Post '[JSON] RangeResponse

server :: Server API
server = isDateInRangeHandler

isDateInRangeHandler :: RangeRequest -> Handler RangeResponse
isDateInRangeHandler req =
  let (res, index, matches) = isDateInGivenRange
                                (eventDate req)
                                (windowStart req)
                                (windowEnd req)
                                (repeatInterval req)
                                (repeatType req)
  in return $ RangeResponse res index matches

api :: Proxy API
api = Proxy

app :: Application
app = serve api server

main :: IO ()
main = do
  putStrLn "🚀 Running on http://localhost:8080"
  run 8080 app
