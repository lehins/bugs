{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TypeFamilyDependencies #-}
{-# LANGUAGE UndecidableInstances #-}

module Main (main) where
import Data.Kind
import Data.Set (Set)
import qualified Data.Set as Set
import Text.Read (readEither)

newtype Decoder a = Decoder (String -> Either Error (String, a))
newtype Encoder = Encoder (String -> String)

class To a where
  encoder :: a -> Encoder

type Error = String

class Monoid (Share a) => From a where
  type Share a :: Type

  decoderWithShare :: Share a -> Decoder (Share a, a)

encode :: To a => a -> String
encode a =
  case encoder a of
    Encoder f -> f ""

decode :: From a => String -> a
decode str =
  case decoderWithShare mempty of
    Decoder f ->
      case f str of
        Left msg -> error msg
        Right ([], (_, a)) -> a
        Right (leftover, _) -> error $ "Leftover input: " ++ leftover

class (Ord (Currency e), From (Tx e), Share (Tx e) ~ Set (Currency e)) => Ledger e where
  type Currency e :: Type
  type Tx e = (r :: Type) | r -> e

data MyLedger c

data MyTx c = MyTx
  { amount :: Integer
  , currency :: c
  } deriving (Show, Read)

instance (Read c, Ord c) => Ledger (MyLedger c) where
  type Currency (MyLedger c) = c
  type Tx (MyLedger c) = MyTx c

instance Show c => To (MyTx c) where
  encoder tx = Encoder (shows (amount tx, currency tx))

instance (Read c, Ledger (MyLedger c)) => From (MyTx c) where
  type Share (MyTx c) = Set c
  decoderWithShare s =
    Decoder $ \str -> do
      (a, c) <- readEither str
      case span (/= ')') str of
        (_, ')':rest) ->
          let (c', s')
                | Set.member c s = (Set.elemAt (Set.findIndex c s) s, s)
                | otherwise = (c, Set.insert c s)
           in Right (rest, (s', MyTx a c'))
        _ -> Left $ "Malformed input: " ++ str

main :: IO ()
main = do
  print (decode $ encode (MyTx 5 "USD") :: MyTx String)
