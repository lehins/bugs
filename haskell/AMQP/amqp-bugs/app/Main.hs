module Main where

import Network.HTTP.Types.Status as Status
import RIO
import Network.AMQP
import Network.Wai as Wai
import Network.Wai.Handler.Warp
import qualified Web.Scotty.Trans as Scotty

main :: IO ()
main = do
  conn <- openConnection'' defaultConnectionOpts
  chan <- openChannel conn
  putStrLn "Using channel ..."
  threadDelay 500000
  putStrLn "Closing channel ..."
  closeChannel chan
  putStrLn "Waiting ..."
  threadDelay 500000
  putStrLn "Exiting ..."


-- main :: IO ()
-- main = do
--   conn <-
--     openConnection''
--     defaultConnectionOpts
--       { coServers = [("localhost", 5672)]
--       , coHeartbeatDelay = Just 20
--       , coAuth = [plain "guest" "guest"]
--       , coVHost = "/"
--       }
--   let runChan = do
--         logInfo "Opening channel"
--         chan <- liftIO $ openChannel conn
--         logInfo "Waiting ..."
--         threadDelay 1000000
--         logInfo "Closing channel"
--         liftIO $ closeChannel chan
--   runSimpleApp $ do
--     env <- ask
--     let opts =
--           Scotty.Options 0 $
--             setPort 8888 $
--             setTimeout 3 $
--             setFdCacheDuration 10 $
--             setLogger (mkLogger (env ^. logFuncL)) $
--             setOnException (mkExceptionLogger (env ^. logFuncL))
--             defaultSettings
--     let runApp = Scotty.scottyOptsT opts (runRIO env) app
--     concurrently_ runApp runChan


-- displayRequest :: Request -> Utf8Builder
-- displayRequest req =
--   displayShow (requestMethod req) <> " " <> displayShow (rawPathInfo req)

-- mkLogger :: LogFunc -> Wai.Request -> Status.Status -> Maybe Integer -> IO ()
-- mkLogger logFunc req status _mFileSize =
--   runRIO logFunc $
--   logInfo $
--   mconcat ["HTTP:", display (statusCode status), " ", displayRequest req]

-- mkExceptionLogger :: LogFunc -> Maybe Wai.Request -> SomeException -> IO ()
-- mkExceptionLogger logFunc mRequest exc =
--   runRIO logFunc $ logError $
--   "Exception when servicing HTTP request " <>
--   maybe "unknown" displayRequest mRequest <> " - " <> displayShow exc


-- app :: Scotty.ScottyT LText (RIO SimpleApp) ()
-- app = do
--   Scotty.get "/health" $ do
--     Scotty.text "Healthy."
--     Scotty.status ok200
