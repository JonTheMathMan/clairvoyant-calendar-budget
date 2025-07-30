To expose your `isDateInGivenRange` function via an API in Haskell, you can use the [Servant](https://hackage.haskell.org/package/servant) library, which is a powerful and type-safe way to define and serve APIs.

Here’s a complete minimal example of a Haskell web server using Servant that includes an endpoint for `isDateInGivenRange`.

---

### 📦 Dependencies (in `package.yaml` or `.cabal`)

Make sure your project has at least:

```yaml
dependencies:
  - base >= 4.7 && < 5
  - servant
  - servant-server
  - servant-frontend
  - servant-swagger
  - aeson
  - warp
  - text
```

---

### 🧠 Step 1: Types & Imports

```haskell
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.Aeson (FromJSON, ToJSON)
import GHC.Generics (Generic)
import Network.Wai
import Network.Wai.Handler.Warp (run)
import Servant
import Data.Text (Text)
```

---

### 🧩 Step 2: Define API Types

```haskell
-- Define a Date type (YYYY, MM, DD)
type Date = (Int, Int, Int)

-- Input data from client
data RangeRequest = RangeRequest
  { eventDate      :: Date
  , windowStart    :: Date
  , windowEnd      :: Date
  , repeatInterval :: Int
  , repeatType     :: String
  } deriving (Generic, Show)

instance FromJSON RangeRequest
instance ToJSON RangeRequest

-- Output data
data RangeResponse = RangeResponse
  { occursInRange :: Bool
  , matchIndex    :: Int
  , allMatches    :: [Date]
  } deriving (Generic, Show)

instance ToJSON RangeResponse
```

---

### 🧮 Step 3: Core Logic

```haskell
-- Dummy versions of these functions (replace with your actual logic)
getRepeatedDays :: Date -> Date -> Date -> Int -> (Bool, Int, [Date])
getRepeatedDays d1 d2 d3 interval = (True, 0, [d1, d2, d3])  -- placeholder

getRepeatedMonths :: Date -> Date -> Date -> Int -> (Bool, Int, [Date])
getRepeatedMonths d1 d2 d3 interval = (False, -1, [])  -- placeholder

-- The main function logic
isDateInGivenRange :: Date -> Date -> Date -> Int -> String -> (Bool, Int, [Date])
isDateInGivenRange eventDate windowStart windowEnd repeatInterval repeatType =
  case repeatType of
    "daily" -> getRepeatedDays eventDate windowStart windowEnd 1
    "weekly - every same day of the week" -> getRepeatedDays eventDate windowStart windowEnd 7
    "monthly - same day of the month" -> getRepeatedMonths eventDate windowStart windowEnd 1
    "interval - every N days" -> getRepeatedDays eventDate windowStart windowEnd repeatInterval
    "interval - every N weeks" -> getRepeatedDays eventDate windowStart windowEnd (repeatInterval * 7)
    "interval - every N Months on the same day of the month" -> getRepeatedMonths eventDate windowStart windowEnd repeatInterval
    _ -> (False, 0, [])
```

---

### 🌐 Step 4: Define API and Server

```haskell
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
```

---

### 🚀 Step 5: Run the Server

```haskell
api :: Proxy API
api = Proxy

app :: Application
app = serve api server

main :: IO ()
main = do
  putStrLn "🚀 Running on http://localhost:8080"
  run 8080 app
```

---

### 📬 Example Request (via `curl` or Postman)

```bash
curl -X POST http://localhost:8080/isDateInGivenRange \
  -H "Content-Type: application/json" \
  -d '{
        "eventDate": [2025, 7, 30],
        "windowStart": [2025, 7, 1],
        "windowEnd": [2025, 8, 1],
        "repeatInterval": 1,
        "repeatType": "daily"
      }'
```

---

Would you like a version of this that includes `stack.yaml` or `cabal` scaffolding as well?
